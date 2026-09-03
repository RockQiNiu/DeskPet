#include "ApplicationController.h"
#include <QCoreApplication>
#include <QColor>
#include <QPixmap>
#include <QDateTime>
#include <QGuiApplication>
#include <QScreen>
#include <QRandomGenerator>
#include <QtMath>
#ifdef Q_OS_WIN
#include <windows.h>
#endif
ApplicationController::ApplicationController(QObject *p) : QObject(p), m_tray(this), m_trayMenu() {
    // CPU is a machine-wide signal. Do not discard it merely because the user
    // has stopped moving the mouse while a stress/build task is running.
    connect(&m_systemMonitor, &SystemMonitor::highCpu, this, [this] { m_pet.trigger("cpu"); });
    connect(&m_systemMonitor, &SystemMonitor::cpuNormal, this, [this] { m_pet.trigger("idle"); });
    connect(&m_activityMonitor, &ActivityMonitor::ideFocused, this, [this](const QString &, const QString &) {
        m_pet.trigger("coding");
        m_lastCodingMs = QDateTime::currentMSecsSinceEpoch();
    });
    connect(&m_activityMonitor, &ActivityMonitor::ideFocusLost, this, [this] { m_pet.returnToIdleIfWorking(); });
    connect(&m_buildMonitor, &BuildMonitor::buildStarted, this, [this](const QString &) { m_pet.trigger("coding"); });
    connect(&m_buildMonitor, &BuildMonitor::buildSucceeded, this, [this](const QString &) { m_pet.trigger("success"); });
    connect(&m_buildMonitor, &BuildMonitor::buildFailed, this, [this](const QString &, unsigned long) { m_pet.trigger("failed"); });
    connect(&m_processMonitor, &ProcessMonitor::processCrashed, this, [this](const QString &, unsigned long) { m_pet.trigger("crash"); });
    connect(&m_movement, &DesktopMovementController::targetChanged, this, &ApplicationController::movementTargetChanged);
    connect(&m_pet, &PetController::dialogueChanged, this, [this] { m_movement.chooseTarget(); });
    QIcon icon(QStringLiteral(":/qt/qml/DeskPet/assets/pets/mage2d/idle/idle_0001.png"));
    if (icon.isNull()) { QPixmap fallback(32, 32); fallback.fill(QColor("#ef8f5b")); icon = QIcon(fallback); }
    m_tray.setIcon(icon); m_tray.setToolTip(QStringLiteral("ProgrammerPet"));
    m_toggleAction = m_trayMenu.addAction(QStringLiteral("Show / Hide Pet"));
    connect(m_toggleAction, &QAction::triggered, this, &ApplicationController::togglePetWindow);
    m_trayMenu.addSeparator();
    auto add = [this](const QString &label, const QString &event) { auto *a = m_trayMenu.addAction(label); connect(a, &QAction::triggered, this, [this, event] { m_pet.trigger(event); }); };
    add("Idle", "idle"); add("Walk", "walk"); add("Jump", "jump"); add("Git Commit", "commit"); add("High CPU", "cpu"); add("Program Crash", "crash");
    m_trayMenu.addSeparator(); auto *exitAction = m_trayMenu.addAction(QStringLiteral("Exit")); connect(exitAction, &QAction::triggered, this, &ApplicationController::quit);
    m_tray.setContextMenu(&m_trayMenu); m_tray.show();
    m_interactionTimer.setInterval(400);
    connect(&m_interactionTimer, &QTimer::timeout, this, &ApplicationController::pollDesktopInteraction);
    m_interactionTimer.start();
}
void ApplicationController::movePet() { m_movement.chooseTarget(); }
void ApplicationController::quit() { QCoreApplication::quit(); }
void ApplicationController::togglePetWindow() { m_petVisible = !m_petVisible; emit petVisibleChanged(); }
void ApplicationController::updatePetPosition(int x, int y) { m_petX = x; m_petY = y; }

void ApplicationController::moveTo(int x, int y)
{
    const QRect area = QGuiApplication::primaryScreen()->availableGeometry();
    emit movementTargetChanged(qBound(area.left(), x, area.right() - 360),
                               qBound(area.top(), y, area.bottom() - 400));
}

void ApplicationController::petClicked()
{
#ifdef Q_OS_WIN
    POINT cursor{}; GetCursorPos(&cursor);
    int dx = m_petX + 180 - cursor.x;
    int dy = m_petY + 220 - cursor.y;
    if (qAbs(dx) + qAbs(dy) < 10) dx = 1;
    m_pet.trigger("avoid");
    moveTo(m_petX + (dx >= 0 ? 230 : -230), m_petY + (dy >= 0 ? 120 : -120));
    QTimer::singleShot(1100, this, [this] { m_pet.trigger("idle"); });
#endif
}

void ApplicationController::pollDesktopInteraction()
{
#ifdef Q_OS_WIN
    LASTINPUTINFO input{ sizeof(LASTINPUTINFO) };
    GetLastInputInfo(&input);
    const DWORD idleMs = GetTickCount() - input.dwTime;
    HWND window = GetForegroundWindow();
    if (!window) return;
    wchar_t className[64]{}; GetClassNameW(window, className, 64);
    const QString windowClass = QString::fromWCharArray(className);
    DWORD processId = 0; GetWindowThreadProcessId(window, &processId);
    const bool ownWindow = processId == GetCurrentProcessId();
    const bool desktop = window == GetDesktopWindow() || windowClass == "Progman" || windowClass == "WorkerW";
    const qint64 now = QDateTime::currentMSecsSinceEpoch();

    // A short idle interval is deliberately used here: no key values are read
    // or stored, only the Windows last-input timestamp.
    // CPU high needs three consecutive one-second samples. Keep the input
    // activity window long enough for a user-launched stress test to reach it.
    m_activeWorkContext = !desktop && !ownWindow && idleMs < 6000;
    if (m_activeWorkContext) {
        if (m_activityMonitor.ideActive() && now - m_lastCodingMs > 10000) {
            m_pet.trigger("coding");
            m_lastCodingMs = now;
        }

        // The actual system clock is the source of truth, which keeps this
        // straightforward to test by changing Windows time.  The reminder is
        // intentionally rate limited to one notification every 30 minutes.
        const QTime time = QTime::currentTime();
        if (m_activityMonitor.ideActive() && time.hour() >= 2 && time.hour() < 6
            && now - m_lastLateNightMs >= 30 * 60 * 1000) {
            m_pet.trigger("sleep");
            m_lastLateNightMs = now;
        }
        return;
    }

    const QString state = m_pet.state();
    if (state != "Idle" && state != "Walking" && state != "Perching" && state != "ChasingMouse" && state != "Jumping") return;

    POINT cursor{}; GetCursorPos(&cursor);
    const int mouseDistance = qAbs(cursor.x - m_lastMouseX) + qAbs(cursor.y - m_lastMouseY);
    m_lastMouseX = cursor.x;
    m_lastMouseY = cursor.y;

    // During the bounded chase, smoothly follow the live cursor without
    // redispatching the event/state. This avoids the former circling loop while
    // still letting the tiger close the gap when the user keeps moving.
    if (desktop && !ownWindow && state == "ChasingMouse") {
        if (mouseDistance > 8)
            moveTo(cursor.x - 180, cursor.y - 250);
        return;
    }

    // On the desktop, chase only a deliberately moving mouse. When it is still,
    // autonomous walking/jumping is allowed instead of continuously chasing.
    if (desktop && !ownWindow && mouseDistance > 22 && now - m_lastChaseMs > 4500) {
        m_pet.trigger("chase");
        // Pet.qml is vertically offset inside the transparent window. Aim the
        // visible tiger's centre at the cursor rather than the window centre.
        moveTo(cursor.x - 180, cursor.y - 250);
        m_lastChaseMs = now;
        QTimer::singleShot(4000, this, [this] {
            if (m_pet.state() == "ChasingMouse")
                m_pet.trigger("idle");
        });
        return;
    }

    // Keep this GUI-thread polling path deliberately simple. Enumerating every
    // native window here caused a QtCore access violation on this machine.
    // A normal foreground application still supports perching and following;
    // background-window selection belongs in a separate native worker.
    struct Candidate { HWND handle = nullptr; RECT rect{}; } candidate;
    if (!desktop && !ownWindow && IsWindowVisible(window) && !IsIconic(window) && !IsZoomed(window)) {
        RECT rect{};
        if (GetWindowRect(window, &rect) && rect.right - rect.left >= 250 && rect.bottom - rect.top >= 180) {
            candidate.handle = window;
            candidate.rect = rect;
        }
    }

    if (candidate.handle && (idleMs >= 1800 || m_perchedWindow == candidate.handle)) {
        const bool moved = m_perchedWindow == candidate.handle
            && (m_perchedLeft != candidate.rect.left || m_perchedTop != candidate.rect.top
                || m_perchedRight != candidate.rect.right || m_perchedBottom != candidate.rect.bottom);
        m_perchedWindow = candidate.handle;
        m_perchedLeft = candidate.rect.left; m_perchedTop = candidate.rect.top;
        m_perchedRight = candidate.rect.right; m_perchedBottom = candidate.rect.bottom;
        m_pet.trigger("perch");
        moveTo(candidate.rect.left + (candidate.rect.right - candidate.rect.left - 360) / 2,
               candidate.rect.top - 395);
        if (moved) emit perchWindowMoved();
        return;
    }

    m_perchedWindow = nullptr;
    if (desktop && idleMs < 10000)
        m_lastIdleJumpMs = 0;
    // A clearly visible idle beat: after ten seconds without mouse/keyboard
    // input on the desktop, jump once, then return to normal autonomy.
    if (desktop && idleMs >= 10000
        && (m_lastIdleJumpMs == 0 || now - m_lastIdleJumpMs >= 10000)) {
        m_pet.trigger("jump");
        m_lastIdleJumpMs = now;
        QTimer::singleShot(1000, this, [this] {
            if (m_pet.state() == "Jumping")
                m_pet.trigger("idle");
        });
        return;
    }
    if (desktop && idleMs >= 4000 && now - m_lastAutonomyMs >= 4500) {
        if (QRandomGenerator::global()->bounded(4) == 0)
            m_pet.trigger("jump");
        else
            m_pet.trigger("walk");
        m_movement.chooseTarget();
        m_lastAutonomyMs = now;
    }
#endif
}

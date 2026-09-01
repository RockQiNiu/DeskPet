#include "ApplicationController.h"
#include <QCoreApplication>
#include <QColor>
#include <QPixmap>
#include <QDateTime>
#include <QGuiApplication>
#include <QScreen>
#include <QtMath>
#ifdef Q_OS_WIN
#include <windows.h>
#endif
ApplicationController::ApplicationController(QObject *p) : QObject(p), m_tray(this), m_trayMenu() {
    connect(&m_systemMonitor, &SystemMonitor::highCpu, this, [this] { m_pet.trigger("cpu"); });
    connect(&m_systemMonitor, &SystemMonitor::cpuNormal, this, [this] { m_pet.trigger("idle"); });
    connect(&m_activityMonitor, &ActivityMonitor::ideFocused, this, [this](const QString &, const QString &) { m_pet.trigger("coding"); });
    connect(&m_activityMonitor, &ActivityMonitor::ideFocusLost, this, [this] { m_pet.returnToIdleIfWorking(); });
    connect(&m_movement, &DesktopMovementController::targetChanged, this, &ApplicationController::movementTargetChanged);
    QIcon icon(QStringLiteral(":/qt/qml/DeskPet/assets/pets/cat/cat.svg"));
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
                               qBound(area.top(), y, area.bottom() - 330));
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
    const QString state = m_pet.state();
    if (state != "Idle" && state != "Walking" && state != "Perching" && state != "ChasingMouse") return;
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
    if (desktop && !ownWindow && now - m_lastChaseMs > 1400) {
        POINT cursor{}; GetCursorPos(&cursor);
        m_pet.trigger("chase");
        moveTo(cursor.x - 180, cursor.y - 230);
        m_lastChaseMs = now;
        return;
    }
    if (idleMs < 3000 || ownWindow || desktop || !IsWindowVisible(window) || IsIconic(window)) return;
    RECT rect{}; if (!GetWindowRect(window, &rect) || rect.right - rect.left < 160 || rect.bottom - rect.top < 120) return;
    m_pet.trigger("perch");
    moveTo(rect.left + (rect.right - rect.left - 360) / 2, rect.top - 325);
#endif
}

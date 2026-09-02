#pragma once
#include <QObject>
#include <QSystemTrayIcon>
#include <QMenu>
#include <QTimer>
#include "../pet/PetController.h"
#include "../interaction/DesktopMovementController.h"
#include "../monitor/SystemMonitor.h"
#include "../monitor/ActivityMonitor.h"
#include "../monitor/BuildMonitor.h"
#include "../monitor/ProcessMonitor.h"
class ApplicationController : public QObject {
    Q_OBJECT Q_PROPERTY(PetController* pet READ pet CONSTANT)
public: explicit ApplicationController(QObject *parent = nullptr);
    Q_PROPERTY(bool petVisible READ petVisible NOTIFY petVisibleChanged)
    PetController *pet() { return &m_pet; }
    Q_INVOKABLE void movePet(); Q_INVOKABLE void quit();
    Q_INVOKABLE void togglePetWindow();
    Q_INVOKABLE void updatePetPosition(int x, int y);
    Q_INVOKABLE void petClicked();
    bool petVisible() const { return m_petVisible; }
signals: void movementTargetChanged(int x, int y);
    void perchWindowMoved();
    void petVisibleChanged();
private: PetController m_pet; DesktopMovementController m_movement; SystemMonitor m_systemMonitor; ActivityMonitor m_activityMonitor; BuildMonitor m_buildMonitor; ProcessMonitor m_processMonitor;
    void pollDesktopInteraction();
    void moveTo(int x, int y);
    QSystemTrayIcon m_tray;
    QMenu m_trayMenu;
    QAction *m_toggleAction = nullptr;
    bool m_petVisible = true;
    QTimer m_interactionTimer;
    int m_petX = 0;
    int m_petY = 0;
    qint64 m_lastChaseMs = 0;
    qint64 m_lastCodingMs = 0;
    qint64 m_lastLateNightMs = 0;
    qint64 m_lastAutonomyMs = 0;
    qint64 m_lastIdleJumpMs = 0;
    int m_lastMouseX = 0;
    int m_lastMouseY = 0;
    void *m_perchedWindow = nullptr;
    int m_perchedLeft = 0;
    int m_perchedTop = 0;
    int m_perchedRight = 0;
    int m_perchedBottom = 0;
    bool m_activeWorkContext = false;
};

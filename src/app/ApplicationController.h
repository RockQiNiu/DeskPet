#pragma once
#include <QObject>
#include <QSystemTrayIcon>
#include <QMenu>
#include <QTimer>
#include "../pet/PetController.h"
#include "../interaction/DesktopMovementController.h"
#include "../monitor/SystemMonitor.h"
#include "../monitor/ActivityMonitor.h"
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
    void petVisibleChanged();
private: PetController m_pet; DesktopMovementController m_movement; SystemMonitor m_systemMonitor; ActivityMonitor m_activityMonitor;
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
};

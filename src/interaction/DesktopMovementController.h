#pragma once
#include <QObject>
class DesktopMovementController : public QObject {
    Q_OBJECT
public: explicit DesktopMovementController(QObject *parent = nullptr);
public slots: void chooseTarget();
signals: void targetChanged(int x, int y);
private: int m_x = 0; int m_y = 0;
};

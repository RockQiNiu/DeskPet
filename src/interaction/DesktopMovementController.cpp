#include "DesktopMovementController.h"
#include <QGuiApplication>
#include <QScreen>
#include <QRandomGenerator>
DesktopMovementController::DesktopMovementController(QObject *p) : QObject(p) {}
void DesktopMovementController::chooseTarget() {
    const QRect area = QGuiApplication::primaryScreen()->availableGeometry();
    m_x = area.left() + QRandomGenerator::global()->bounded(qMax(1, area.width() - 360));
    m_y = area.top() + QRandomGenerator::global()->bounded(qMax(1, area.height() - 400));
    emit targetChanged(m_x, m_y);
}

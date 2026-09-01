#pragma once
#include <QObject>
#include <QDateTime>
#include <QVariantMap>
#include "../pet/PetEvent.h"
struct PetEvent { PetEventType type; QDateTime timestamp = QDateTime::currentDateTime(); QVariantMap data; };
Q_DECLARE_METATYPE(PetEvent)
class EventBus : public QObject {
    Q_OBJECT
public:
    explicit EventBus(QObject *p = nullptr) : QObject(p) {}
public slots:
    void publish(const PetEvent &event) { emit eventPublished(event); }
signals:
    void eventPublished(const PetEvent &event);
};

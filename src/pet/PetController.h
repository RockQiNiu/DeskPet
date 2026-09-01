#pragma once
#include <QObject>
#include "PetStateMachine.h"
class PetController : public QObject {
    Q_OBJECT Q_PROPERTY(QString state READ state NOTIFY stateChanged)
    Q_PROPERTY(QString dialogue READ dialogue NOTIFY dialogueChanged)
    Q_PROPERTY(int buildFailureCount READ buildFailureCount NOTIFY buildFailureCountChanged)
public: explicit PetController(QObject *parent = nullptr);
    QString state() const { return m_machine.state() == PetState::Idle ? "Idle" : petStateName(m_machine.state()); }
    QString dialogue() const { return m_dialogue; }
    int buildFailureCount() const { return m_buildFailures; }
    Q_INVOKABLE void trigger(QString eventName);
    Q_INVOKABLE void returnToIdleIfWorking();
    Q_INVOKABLE void triggerBuildFailures(int count);
    Q_INVOKABLE void resetBuildFailures();
signals: void stateChanged(); void transitionLogged(QString message); void dialogueChanged(); void buildFailureCountChanged();
private: PetStateMachine m_machine; QString m_dialogue; int m_buildFailures = 0;
};

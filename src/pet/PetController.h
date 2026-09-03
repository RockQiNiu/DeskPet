#pragma once
#include <QObject>
#include "PetStateMachine.h"
#include "../core/EventBus.h"
class PetController : public QObject {
    Q_OBJECT Q_PROPERTY(QString state READ state NOTIFY stateChanged)
    Q_PROPERTY(QString dialogue READ dialogue NOTIFY dialogueChanged)
    Q_PROPERTY(QString audioFile READ audioFile NOTIFY audioCueChanged)
    Q_PROPERTY(int audioSequence READ audioSequence NOTIFY audioCueChanged)
    Q_PROPERTY(int buildFailureCount READ buildFailureCount NOTIFY buildFailureCountChanged)
public: explicit PetController(QObject *parent = nullptr);
    QString state() const { return m_machine.state() == PetState::Idle ? "Idle" : petStateName(m_machine.state()); }
    QString dialogue() const { return m_dialogue; }
    QString audioFile() const { return m_audioFile; }
    int audioSequence() const { return m_audioSequence; }
    int buildFailureCount() const { return m_buildFailures; }
    Q_INVOKABLE void trigger(QString eventName);
    Q_INVOKABLE void returnToIdleIfWorking();
    Q_INVOKABLE void triggerBuildFailures(int count);
    Q_INVOKABLE void resetBuildFailures();
    Q_INVOKABLE void completeAnimation(const QString &animation);
signals: void stateChanged(); void transitionLogged(QString message); void dialogueChanged(); void audioCueChanged(); void buildFailureCountChanged();
private:
    EventBus m_eventBus;
    PetStateMachine m_machine;
    QString m_dialogue;
    QString m_audioFile;
    int m_audioSequence = 0;
    int m_buildFailures = 0;
    qint64 m_criticalUntilMs = 0;
    qint64 m_buildFailureUntilMs = 0;
};

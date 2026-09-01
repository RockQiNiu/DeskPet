#pragma once
#include <QObject>
#include "PetState.h"
#include "PetEvent.h"

class PetStateMachine : public QObject {
    Q_OBJECT
public: explicit PetStateMachine(QObject *parent = nullptr);
    PetState state() const { return m_state; }
public slots: void dispatch(PetEventType event);
signals: void stateChanged(QString state); void transitionLogged(QString message);
private: PetState m_state = PetState::Idle;
};

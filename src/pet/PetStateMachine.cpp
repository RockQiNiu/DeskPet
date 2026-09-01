#include "PetStateMachine.h"
#include <QDebug>
PetStateMachine::PetStateMachine(QObject *parent) : QObject(parent) {}
void PetStateMachine::dispatch(PetEventType event)
{
    PetState next = m_state;
    switch (event) {
    case PetEventType::IdleTimeout: next = PetState::Walking; break;
    case PetEventType::UserCoding: case PetEventType::BuildStarted: next = PetState::Working; break;
    case PetEventType::BuildFailed: next = PetState::Angry; break;
    case PetEventType::BuildSuccess: next = PetState::Happy; break;
    case PetEventType::HighCpu: next = PetState::Smoking; break;
    case PetEventType::GitCommit: next = PetState::Celebrating; break;
    case PetEventType::LateNight: next = PetState::Sleeping; break;
    case PetEventType::ProgramCrash: next = PetState::Dead; break;
    case PetEventType::MouseApproaching: next = PetState::AvoidingMouse; break;
    case PetEventType::MouseLeaving: next = PetState::ChasingMouse; break;
    case PetEventType::UserDraggingPet: next = PetState::Dragging; break;
    case PetEventType::JumpRequested: next = PetState::Jumping; break;
    case PetEventType::PerchRequested: next = PetState::Perching; break;
    case PetEventType::WindowDragRequested: next = PetState::Dragging; break;
    case PetEventType::CpuNormal: next = PetState::Idle; break;
    }
    if (next == m_state) return;
    const QString message = petStateName(m_state) + " -> " + petStateName(next);
    m_state = next; qDebug().noquote() << "[PetStateMachine]" << message;
    emit transitionLogged(message); emit stateChanged(petStateName(m_state));
}


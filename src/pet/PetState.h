#pragma once
#include <QString>

enum class PetState { Idle, Walking, Running, Jumping, Sleeping, Working, Happy, Angry,
                      Smoking, Celebrating, Dead, Perching, Dragging, ChasingMouse, AvoidingMouse };

inline QString petStateName(PetState state)
{
    switch (state) {
    case PetState::Walking: return "Walking"; case PetState::Running: return "Running";
    case PetState::Jumping: return "Jumping"; case PetState::Sleeping: return "Sleeping";
    case PetState::Working: return "Working"; case PetState::Happy: return "Happy";
    case PetState::Angry: return "Angry"; case PetState::Smoking: return "Smoking";
    case PetState::Celebrating: return "Celebrating"; case PetState::Dead: return "Dead";
    case PetState::Perching: return "Perching";
    case PetState::Dragging: return "Dragging"; case PetState::ChasingMouse: return "ChasingMouse";
    case PetState::AvoidingMouse: return "AvoidingMouse"; default: return "Idle";
    }
}

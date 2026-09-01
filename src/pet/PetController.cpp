#include "PetController.h"
#include <QHash>
#include "../dialogue/DialogueManager.h"

PetController::PetController(QObject *parent) : QObject(parent) {
    connect(&m_machine, &PetStateMachine::stateChanged, this, [this](const QString &) { emit stateChanged(); });
    connect(&m_machine, &PetStateMachine::transitionLogged, this, &PetController::transitionLogged);
}
void PetController::trigger(QString name) {
    static const QHash<QString, PetEventType> map{{"idle",PetEventType::CpuNormal},{"walk",PetEventType::IdleTimeout},{"jump",PetEventType::JumpRequested},{"coding",PetEventType::UserCoding},{"success",PetEventType::BuildSuccess},{"failed",PetEventType::BuildFailed},{"cpu",PetEventType::HighCpu},{"commit",PetEventType::GitCommit},{"sleep",PetEventType::LateNight},{"crash",PetEventType::ProgramCrash},{"perch",PetEventType::PerchRequested},{"chase",PetEventType::MouseLeaving},{"avoid",PetEventType::MouseApproaching}};
    if (!map.contains(name)) return;
    if (name == "failed") { ++m_buildFailures; emit buildFailureCountChanged(); }
    if (name == "success") { m_buildFailures = 0; emit buildFailureCountChanged(); }
    m_machine.dispatch(map.value(name));
    const bool silent = name == "walk" || name == "perch" || name == "chase" || name == "avoid" || name == "idle";
    if (!silent) {
        DialogueManager d; QString key = name == "coding" ? "coding" : name == "commit" ? "git_commit" : name == "cpu" ? "high_cpu" : name == "crash" ? "program_crash" : name == "success" ? "build_success" : name == "failed" ? "build_failed" : "late_night";
        m_dialogue = d.forEvent(key, m_buildFailures); emit dialogueChanged();
    }
}
void PetController::triggerBuildFailures(int count) { for (int i = 0; i < count; ++i) trigger("failed"); }
void PetController::resetBuildFailures() { m_buildFailures = 0; emit buildFailureCountChanged(); }
void PetController::returnToIdleIfWorking()
{
    if (m_machine.state() == PetState::Working) trigger("idle");
}

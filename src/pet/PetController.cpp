#include "PetController.h"
#include <QHash>
#include <QDateTime>
#include <QTimer>
#include "../dialogue/DialogueManager.h"

PetController::PetController(QObject *parent) : QObject(parent) {
    connect(&m_machine, &PetStateMachine::stateChanged, this, [this](const QString &) { emit stateChanged(); });
    connect(&m_machine, &PetStateMachine::transitionLogged, this, &PetController::transitionLogged);
}
void PetController::trigger(QString name) {
    static const QHash<QString, PetEventType> map{{"idle",PetEventType::CpuNormal},{"walk",PetEventType::IdleTimeout},{"jump",PetEventType::JumpRequested},{"coding",PetEventType::UserCoding},{"success",PetEventType::BuildSuccess},{"failed",PetEventType::BuildFailed},{"cpu",PetEventType::HighCpu},{"commit",PetEventType::GitCommit},{"sleep",PetEventType::LateNight},{"crash",PetEventType::ProgramCrash},{"perch",PetEventType::PerchRequested},{"chase",PetEventType::MouseLeaving},{"avoid",PetEventType::MouseApproaching}};
    if (!map.contains(name)) return;
    const qint64 now = QDateTime::currentMSecsSinceEpoch();
    // A crash is Critical: never let an IDE focus/coding event immediately
    // replace the death animation or its dialogue.
    if (name != "crash" && now < m_criticalUntilMs) return;
    // Build failures are medium priority: keep the angry state/dialogue long
    // enough to be seen, but still let a crash or CPU emergency interrupt it.
    if (now < m_buildFailureUntilMs
        && (name == "coding" || name == "walk" || name == "jump" || name == "perch"
            || name == "chase" || name == "avoid" || name == "idle")) return;
    if (name == "crash") {
        m_criticalUntilMs = now + 8000;
        QTimer::singleShot(8000, this, [this] {
            m_criticalUntilMs = 0;
            trigger("idle");
        });
    }
    if (name == "failed") { ++m_buildFailures; emit buildFailureCountChanged(); }
    if (name == "success") { m_buildFailures = 0; emit buildFailureCountChanged(); }
    if (name == "failed") {
        m_buildFailureUntilMs = now + 6000;
        QTimer::singleShot(6000, this, [this] {
            if (QDateTime::currentMSecsSinceEpoch() >= m_buildFailureUntilMs) trigger("idle");
        });
    }
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

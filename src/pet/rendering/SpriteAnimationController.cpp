#include "SpriteAnimationController.h"

#include <QFile>
#include <QHash>
#include <QDebug>
#include <QSet>

SpriteAnimationController::SpriteAnimationController(QObject *parent) : QObject(parent)
{
    connect(&m_timer, &QTimer::timeout, this, &SpriteAnimationController::advanceFrame);
    play();
}

SpriteAnimationController::Definition SpriteAnimationController::definitionFor(const QString &name)
{
    static const QHash<QString, Definition> definitions {
        {"idle", {8, 8, true}}, {"walk", {12, 12, true}}, {"run", {12, 16, true}},
        {"jump", {12, 12, false}}, {"sit", {8, 8, true}},
        {"wave", {12, 10, false}}, {"sleep", {8, 6, true}}, {"celebrate", {12, 12, false}},
        {"dead", {8, 8, false}}, {"angry", {8, 10, true}}, {"happy", {8, 8, true}}
    };
    return definitions.value(name, definitions.value("idle"));
}

bool SpriteAnimationController::isKnownAnimation(const QString &name)
{
    static const QSet<QString> names {"idle", "walk", "run", "jump", "sit", "wave", "sleep",
                                      "celebrate", "dead", "angry", "happy"};
    return names.contains(name);
}

QString SpriteAnimationController::animationForState(const QString &stateName)
{
    static const QHash<QString, QString> mapping {
        {"Idle", "idle"}, {"Walking", "walk"}, {"Running", "run"}, {"Jumping", "jump"},
        {"Working", "idle"}, {"Happy", "happy"}, {"Angry", "angry"},
        {"Sleeping", "sleep"}, {"Sleepy", "sleep"}, {"Smoking", "idle"},
        {"Celebrating", "celebrate"}, {"Dead", "dead"}, {"Perching", "sit"},
        {"Dragging", "idle"}, {"ChasingMouse", "run"}, {"AvoidingMouse", "run"},
        {"WindowDragging", "walk"}, {"Waving", "wave"}
    };
    return mapping.value(stateName, QStringLiteral("idle"));
}

QUrl SpriteAnimationController::frameSource() const
{
    const QString file = QStringLiteral("%1_%2.png").arg(m_animation).arg(m_currentFrame, 4, 10, QLatin1Char('0'));
    const QString resourcePath = QStringLiteral(":/qt/qml/DeskPet/assets/pets/mage2d/%1/%2").arg(m_animation, file);
    if (QFile::exists(resourcePath))
        return QUrl(QStringLiteral("qrc%1").arg(resourcePath));
    qWarning().noquote() << QStringLiteral("[Sprite] animation '%1' frame %2 missing, falling back to idle")
                                 .arg(m_animation).arg(m_currentFrame);
    return QUrl(QStringLiteral("qrc:/qt/qml/DeskPet/assets/pets/mage2d/idle/idle_0001.png"));
}

void SpriteAnimationController::setPetState(const QString &stateName)
{
    setAnimation(animationForState(stateName));
}

void SpriteAnimationController::setAnimation(const QString &name)
{
    const QString resolved = isKnownAnimation(name) ? name : QStringLiteral("idle");
    if (resolved != name)
        qWarning().noquote() << QStringLiteral("[Sprite] animation '%1' is unknown, falling back to idle").arg(name);
    const Definition definition = definitionFor(resolved);
    if (m_animation == resolved && m_fps == definition.fps && m_loop == definition.loop) {
        restart();
        return;
    }
    m_animation = resolved;
    m_frames = definition.frames;
    m_fps = definition.fps;
    m_loop = definition.loop;
    m_currentFrame = 1;
    m_timer.setInterval(1000 / m_fps);
    emit animationChanged();
    emit frameChanged();
    play();
}

void SpriteAnimationController::play()
{
    m_timer.start(1000 / m_fps);
}

void SpriteAnimationController::stop()
{
    m_timer.stop();
}

void SpriteAnimationController::restart()
{
    m_currentFrame = 1;
    emit frameChanged();
    play();
}

void SpriteAnimationController::advanceFrame()
{
    if (m_currentFrame < m_frames) {
        ++m_currentFrame;
    } else if (m_loop) {
        m_currentFrame = 1;
    } else {
        m_timer.stop();
        emit animationFinished(m_animation);
        return;
    }
    emit frameChanged();
}

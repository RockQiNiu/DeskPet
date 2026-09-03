#pragma once

#include <QObject>
#include <QTimer>
#include <QUrl>

class SpriteAnimationController final : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString animation READ animation NOTIFY animationChanged)
    Q_PROPERTY(QString currentAnimation READ animation NOTIFY animationChanged)
    Q_PROPERTY(int currentFrame READ currentFrame NOTIFY frameChanged)
    Q_PROPERTY(int frameCount READ frameCount NOTIFY animationChanged)
    Q_PROPERTY(QUrl frameSource READ frameSource NOTIFY frameChanged)
    Q_PROPERTY(bool looping READ looping NOTIFY animationChanged)
    Q_PROPERTY(bool loop READ looping NOTIFY animationChanged)
    Q_PROPERTY(int fps READ fps NOTIFY animationChanged)

public:
    explicit SpriteAnimationController(QObject *parent = nullptr);

    QString animation() const { return m_animation; }
    int currentFrame() const { return m_currentFrame; }
    int frameCount() const { return m_frames; }
    QUrl frameSource() const;
    bool looping() const { return m_loop; }
    int fps() const { return m_fps; }

    Q_INVOKABLE void setPetState(const QString &stateName);
    Q_INVOKABLE void setAnimation(const QString &name);
    Q_INVOKABLE void play();
    Q_INVOKABLE void stop();
    Q_INVOKABLE void restart();

signals:
    void animationChanged();
    void frameChanged();
    void animationFinished(const QString &animation);

private:
    struct Definition { int frames; int fps; bool loop; };
    static bool isKnownAnimation(const QString &name);
    static Definition definitionFor(const QString &name);
    static QString animationForState(const QString &stateName);
    void advanceFrame();

    QTimer m_timer;
    QString m_animation = QStringLiteral("idle");
    int m_currentFrame = 1;
    int m_frames = 8;
    int m_fps = 8;
    bool m_loop = true;
};

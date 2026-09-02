#pragma once

#include <QObject>
#include <QHash>
#include <QTimer>

// Watches real Windows build-tool processes. It never reads console output or
// source text, only the process identity and final exit code.
class BuildMonitor : public QObject {
    Q_OBJECT
public:
    explicit BuildMonitor(QObject *parent = nullptr);
signals:
    void buildStarted(const QString &tool);
    void buildSucceeded(const QString &tool);
    void buildFailed(const QString &tool, unsigned long exitCode);
private slots:
    void sample();
private:
    struct RunningBuild { void *handle = nullptr; QString tool; bool compilerOnly = false; };
    QTimer m_timer;
    QHash<unsigned long, RunningBuild> m_running;
};

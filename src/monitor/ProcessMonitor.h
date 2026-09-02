#pragma once

#include <QObject>
#include <QHash>
#include <QTimer>

// Windows implementation for an explicitly observed development process.
// The default target is the bundled CrashTrigger test executable.
class ProcessMonitor : public QObject {
    Q_OBJECT
public:
    explicit ProcessMonitor(QObject *parent = nullptr);
    void setObservedProcess(const QString &fileName);
    QString observedProcess() const { return m_observedProcess; }
signals:
    void processStarted(const QString &fileName);
    void processCrashed(const QString &fileName, unsigned long exitCode);
private slots:
    void sample();
private:
    struct Observed { void *handle = nullptr; };
    QTimer m_timer;
    QString m_observedProcess = QStringLiteral("crashtrigger.exe");
    QHash<unsigned long, Observed> m_processes;
};

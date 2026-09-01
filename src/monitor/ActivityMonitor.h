#pragma once

#include <QObject>
#include <QTimer>

class ActivityMonitor : public QObject {
    Q_OBJECT
public:
    explicit ActivityMonitor(QObject *parent = nullptr);
signals:
    void ideFocused(const QString &application, const QString &title);
    void ideFocusLost();
private slots:
    void pollForegroundWindow();
private:
    QTimer m_timer;
    bool m_ideActive = false;
    QString m_lastIdentity;
};

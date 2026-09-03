#pragma once
#include <QObject>
#include <QTimer>
#include "../platform/windows/WindowsSystemProvider.h"
class SystemMonitor : public QObject {
    Q_OBJECT
public:
    explicit SystemMonitor(QObject *p = nullptr);
    void setThreshold(double value) { m_threshold = value; }
signals:
    void highCpu();
    void cpuNormal();
    void snapshot(double cpu, double memory);
private slots:
    void sample();
private:
    QTimer m_timer;
    WindowsSystemProvider m_provider;
    double m_threshold = 80;
    int m_highSamples = 0;
    int m_normalSamples = 0;
    bool m_high = false;
};

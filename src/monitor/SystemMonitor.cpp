#include "SystemMonitor.h"
SystemMonitor::SystemMonitor(QObject *p):QObject(p) { m_timer.setInterval(1000); connect(&m_timer,&QTimer::timeout,this,&SystemMonitor::sample); m_timer.start(); }
void SystemMonitor::sample() {
    const auto s = m_provider.snapshot(); emit snapshot(s.cpu, s.memory);
    if (s.cpu >= m_threshold) { ++m_highSamples; m_normalSamples = 0; }
    else if (s.cpu < m_threshold - 10.0) { ++m_normalSamples; m_highSamples = 0; }
    if (m_highSamples >= 3) { m_high = true; if (m_highSamples % 3 == 0) emit highCpu(); }
    if (m_high && m_normalSamples >= 3) { m_high = false; emit cpuNormal(); }
}

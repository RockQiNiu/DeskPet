#include "ProcessMonitor.h"
#include <QDebug>

#ifdef Q_OS_WIN
#include <windows.h>
#include <tlhelp32.h>
#endif

ProcessMonitor::ProcessMonitor(QObject *parent) : QObject(parent)
{
    m_timer.setInterval(200);
    connect(&m_timer, &QTimer::timeout, this, &ProcessMonitor::sample);
    m_timer.start();
}

void ProcessMonitor::setObservedProcess(const QString &fileName)
{
    m_observedProcess = fileName.trimmed().toLower();
}

void ProcessMonitor::sample()
{
#ifdef Q_OS_WIN
    for (auto it = m_processes.begin(); it != m_processes.end();) {
        HANDLE handle = static_cast<HANDLE>(it->handle);
        if (WaitForSingleObject(handle, 0) != WAIT_OBJECT_0) { ++it; continue; }
        DWORD code = 1; GetExitCodeProcess(handle, &code); CloseHandle(handle);
        it = m_processes.erase(it);
        // A Windows exception such as CrashTrigger's 0xE000DEAD is non-zero.
        if (code != 0) {
            qInfo() << "[ProcessMonitor] crash" << m_observedProcess << "exit=" << code;
            emit processCrashed(m_observedProcess, code);
        }
    }

    const HANDLE snapshot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    if (snapshot == INVALID_HANDLE_VALUE) return;
    PROCESSENTRY32W entry{ sizeof(PROCESSENTRY32W) };
    if (Process32FirstW(snapshot, &entry)) {
        do {
            const unsigned long pid = entry.th32ProcessID;
            if (m_processes.contains(pid)) continue;
            const QString fileName = QString::fromWCharArray(entry.szExeFile).toLower();
            if (fileName != m_observedProcess) continue;
            HANDLE process = OpenProcess(SYNCHRONIZE | PROCESS_QUERY_LIMITED_INFORMATION, FALSE, pid);
            if (!process) continue;
            m_processes.insert(pid, { process });
            qInfo() << "[ProcessMonitor] started" << fileName << "pid=" << pid;
            emit processStarted(fileName);
        } while (Process32NextW(snapshot, &entry));
    }
    CloseHandle(snapshot);
#endif
}

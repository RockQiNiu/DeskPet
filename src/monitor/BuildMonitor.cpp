#include "BuildMonitor.h"
#include <QDebug>

#ifdef Q_OS_WIN
#include <windows.h>
#include <tlhelp32.h>

namespace {
bool isBuildTool(const QString &name)
{
    const QString lower = name.toLower();
    return lower == "ninja.exe" || lower == "msbuild.exe" || lower == "make.exe"
        || lower == "mingw32-make.exe" || lower == "jom.exe" || lower == "cmake.exe";
}

bool isCompiler(const QString &name)
{
    return name.compare("cl.exe", Qt::CaseInsensitive) == 0;
}
}
#endif

BuildMonitor::BuildMonitor(QObject *parent) : QObject(parent)
{
    m_timer.setInterval(250);
    connect(&m_timer, &QTimer::timeout, this, &BuildMonitor::sample);
    m_timer.start();
}

void BuildMonitor::sample()
{
#ifdef Q_OS_WIN
    for (auto it = m_running.begin(); it != m_running.end();) {
        HANDLE handle = static_cast<HANDLE>(it->handle);
        if (WaitForSingleObject(handle, 0) == WAIT_OBJECT_0) {
            DWORD code = 1; GetExitCodeProcess(handle, &code); CloseHandle(handle);
            const QString tool = it->tool;
            const bool compilerOnly = it->compilerOnly;
            it = m_running.erase(it);
            if (code == 0 && !compilerOnly) {
                qInfo() << "[BuildMonitor] success" << tool;
                emit buildSucceeded(tool);
            } else if (code != 0) {
                qInfo() << "[BuildMonitor] failed" << tool << "exit=" << code;
                emit buildFailed(tool, code);
            }
        } else {
            ++it;
        }
    }

    const HANDLE snapshot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    if (snapshot == INVALID_HANDLE_VALUE) return;
    PROCESSENTRY32W entry{ sizeof(PROCESSENTRY32W) };
    if (Process32FirstW(snapshot, &entry)) {
        do {
            const unsigned long pid = entry.th32ProcessID;
            if (m_running.contains(pid)) continue;
            const QString tool = QString::fromWCharArray(entry.szExeFile);
            const bool compilerOnly = isCompiler(tool);
            if (!compilerOnly && !isBuildTool(tool)) continue;
            HANDLE process = OpenProcess(SYNCHRONIZE | PROCESS_QUERY_LIMITED_INFORMATION, FALSE, pid);
            if (!process) continue;
            m_running.insert(pid, { process, tool, compilerOnly });
            if (!compilerOnly) {
                qInfo() << "[BuildMonitor] started" << tool << "pid=" << pid;
                emit buildStarted(tool);
            }
        } while (Process32NextW(snapshot, &entry));
    }
    CloseHandle(snapshot);
#endif
}

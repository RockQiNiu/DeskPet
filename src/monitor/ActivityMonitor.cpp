#include "ActivityMonitor.h"

#ifdef Q_OS_WIN
#include <windows.h>
#endif

namespace {
bool isIde(const QString &value)
{
    const QString lower = value.toLower();
    static const QStringList names = {
        "code.exe", "visual studio", "devenv.exe", "qtcreator", "clion",
        "rider", "vim", "nvim", "neovide", "vscode"
    };
    for (const auto &name : names) if (lower.contains(name)) return true;
    return false;
}
}

ActivityMonitor::ActivityMonitor(QObject *parent) : QObject(parent)
{
    m_timer.setInterval(500);
    connect(&m_timer, &QTimer::timeout, this, &ActivityMonitor::pollForegroundWindow);
    m_timer.start();
}

void ActivityMonitor::pollForegroundWindow()
{
#ifdef Q_OS_WIN
    HWND hwnd = GetForegroundWindow();
    if (!hwnd) return;
    DWORD pid = 0; GetWindowThreadProcessId(hwnd, &pid);
    QString executable;
    HANDLE process = OpenProcess(PROCESS_QUERY_LIMITED_INFORMATION, FALSE, pid);
    if (process) {
        wchar_t path[MAX_PATH]{}; DWORD size = MAX_PATH;
        if (QueryFullProcessImageNameW(process, 0, path, &size)) executable = QString::fromWCharArray(path, int(size));
        CloseHandle(process);
    }
    wchar_t titleBuffer[512]{}; GetWindowTextW(hwnd, titleBuffer, 512);
    const QString title = QString::fromWCharArray(titleBuffer);
    const bool active = isIde(executable) || isIde(title);
    const QString identity = executable + QLatin1Char('|') + title;
    if (active && (!m_ideActive || identity != m_lastIdentity)) emit ideFocused(executable, title);
    if (!active && m_ideActive) emit ideFocusLost();
    m_ideActive = active; m_lastIdentity = identity;
#endif
}

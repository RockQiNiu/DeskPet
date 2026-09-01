#include "WindowsSystemProvider.h"
#ifdef Q_OS_WIN
#include <windows.h>
#endif
SystemSnapshot WindowsSystemProvider::snapshot() {
    SystemSnapshot s;
#ifdef Q_OS_WIN
    FILETIME idle, kernel, user; if (GetSystemTimes(&idle, &kernel, &user)) {
        auto toNumber=[](const FILETIME &f){ return (static_cast<unsigned long long>(f.dwHighDateTime)<<32)|f.dwLowDateTime; };
        const auto ni=toNumber(idle), nk=toNumber(kernel), nu=toNumber(user);
        if (m_ready) { const auto di=ni-m_idle, dk=nk-m_kernel, du=nu-m_user; const auto total=dk+du; if (total) s.cpu=100.0*(1.0-static_cast<double>(di)/total); }
        m_idle=ni; m_kernel=nk; m_user=nu; m_ready=true;
    }
    MEMORYSTATUSEX mem{sizeof(mem)}; if (GlobalMemoryStatusEx(&mem)) s.memory=mem.dwMemoryLoad;
    s.uptime=GetTickCount64()/1000;
#endif
    return s;
}

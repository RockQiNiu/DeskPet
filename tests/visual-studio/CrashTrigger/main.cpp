#include <windows.h>
#include <iostream>

int main()
{
    std::cout << "CrashTrigger will terminate with an abnormal Windows exit code in 2 seconds.\n";
    Sleep(2000);
    // TerminateProcess is intentional here. Unlike RaiseException it does not
    // pause under F5 before the process exits, so ProcessMonitor can observe
    // the abnormal exit during an automated acceptance test.
    TerminateProcess(GetCurrentProcess(), 0xE000DEAD);
    return 0; // Unreachable.
}

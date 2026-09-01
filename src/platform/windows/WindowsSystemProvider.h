#pragma once
#include "../ISystemProvider.h"
class WindowsSystemProvider : public ISystemProvider {
public: SystemSnapshot snapshot() override;
private: unsigned long long m_idle = 0, m_kernel = 0, m_user = 0; bool m_ready = false;
};

#pragma once
#include <QObject>
struct SystemSnapshot { double cpu = 0; double memory = 0; qint64 uptime = 0; };
class ISystemProvider { public: virtual ~ISystemProvider() = default; virtual SystemSnapshot snapshot() = 0; };

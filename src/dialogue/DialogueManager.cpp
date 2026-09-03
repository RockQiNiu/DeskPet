#include "DialogueManager.h"
#include <QRandomGenerator>

DialogueManager::DialogueManager(QObject *parent) : QObject(parent)
{
    m_lines["coding"] = { "The boss finally started coding today." };
    m_lines["build_success"] = { QString::fromUtf8("我就说你是最棒的！") };
    m_lines["high_cpu"] = { "The CPU is almost on fire." };
    m_lines["late_night"] = { "Are you sure you do not want to sleep?" };
    m_lines["git_commit"] = { "You actually committed code today!" };
    m_lines["program_crash"] = { "It is dead. Not my fault." };
    m_lines["idle"] = { "Waiting for the next bug..." };
}

QString DialogueManager::forEvent(const QString &key, int count)
{
    // Every build failure uses this exact Chinese counter message. UTF-8 avoids
    // the source-file encoding corruption that previously produced garbled text.
    if (key == "build_failed") {
        static const QStringList lines = { QString::fromUtf8("高手也有手抖的时候。"), QString::fromUtf8("偶尔犯错，纯属正常。"), QString::fromUtf8("事不过三。"), QString::fromUtf8("你好自为之吧。"), QString::fromUtf8("我已经习惯了。") };
        return QString::fromUtf8("第%1次编译失败，%2").arg(qMax(1, count)).arg(lines.value(qBound(1, count, 5) - 1));
    }
    if (key == "coding") return QString::fromUtf8("主人终于干活了，让牛来陪你。");
    if (key == "high_cpu") return QString::fromUtf8("CPU 80%，牛来要冒烟了！");
    if (key == "late_night") return QString::fromUtf8("你确定不睡？牛马也要休息哦！");
    if (key == "git_commit") return QString::fromUtf8("今天居然提交代码了！");
    if (key == "program_crash") return QString::fromUtf8("妈妈！");

    const auto lines = m_lines.value(key);
    if (lines.isEmpty()) return {};
    int index = QRandomGenerator::global()->bounded(lines.size());
    if (lines.size() > 1 && lines[index] == m_previous.value(key))
        index = (index + 1) % lines.size();
    m_previous[key] = lines[index];
    return lines[index];
}

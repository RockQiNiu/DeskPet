#include "DialogueManager.h"
#include <QRandomGenerator>

DialogueManager::DialogueManager(QObject *parent) : QObject(parent)
{
    m_lines["coding"] = { "The boss finally started coding today." };
    m_lines["build_success"] = { "It finally passed!" };
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
    if (key == "build_failed")
        return QString::fromUtf8("第%1次编译失败，我已经习惯了。").arg(qMax(1, count));
    if (key == "coding") return QString::fromUtf8("主人今天终于开始工作了。");
    if (key == "high_cpu") return QString::fromUtf8("CPU 都快烧了。");
    if (key == "late_night") return QString::fromUtf8("你确定不睡？");
    if (key == "git_commit") return QString::fromUtf8("今天居然提交代码了！");
    if (key == "program_crash") return QString::fromUtf8("它死了，不是我干的。");

    const auto lines = m_lines.value(key);
    if (lines.isEmpty()) return {};
    int index = QRandomGenerator::global()->bounded(lines.size());
    if (lines.size() > 1 && lines[index] == m_previous.value(key))
        index = (index + 1) % lines.size();
    m_previous[key] = lines[index];
    return lines[index];
}

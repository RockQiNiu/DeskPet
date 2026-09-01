#pragma once
#include <QObject>
#include <QHash>
#include <QStringList>
class DialogueManager : public QObject {
    Q_OBJECT
public:
    explicit DialogueManager(QObject *p = nullptr);
    QString forEvent(const QString &key, int count = 0);
private:
    QHash<QString, QStringList> m_lines;
    QHash<QString, QString> m_previous;
};

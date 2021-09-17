#ifndef MESSAGE_H
#define MESSAGE_H

#include <QObject>
#include <QQmlProperty>
#include <QDebug>
#include <QTimer>

class Message : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString author READ author WRITE setAuthor NOTIFY authorChanged)

public:
    Message();

    void setAuthor(const QString &);
    QString author() const;

    Q_INVOKABLE bool postMessage(const QString &);

signals:
    void authorChanged();
    void newMessagePosted(const QString &subject);

private:
    QString m_author;

public slots:
    void refresh();
};

#endif // MESSAGE_H

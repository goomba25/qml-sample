#include "message.h"

Message::Message()
{
    qDebug() << "Message() Construction";
}

void Message::setAuthor(const QString &a)
{
    m_author = QString("%1 world.").arg(a);
    emit authorChanged();
}

QString Message::author() const
{
    return m_author;
}

bool Message::postMessage(const QString &msg)
{
    qDebug() << "[C++] call postMessage method : " << msg;
    return true;
}

void Message::refresh()
{
    qDebug() << "Call the C++ slot";
}

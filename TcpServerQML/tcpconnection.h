#ifndef TCPCONNECTION_H
#define TCPCONNECTION_H

#include <QObject>

class TcpConnection : public QObject
{
    Q_OBJECT
public:
    explicit TcpConnection(QObject *parent = nullptr);

signals:

};

#endif // TCPCONNECTION_H

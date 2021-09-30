#ifndef TCPCONNECTION_H
#define TCPCONNECTION_H

#include <QObject>

class TcpConnection : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int port READ port WRITE setPort NOTIFY portChanged)

    Q_PROPERTY(QString hostname READ hostname WRITE setHostName
               NOTIFY hostNameChanged)

    Q_PROPERTY(ConnectionType type READ connectionType WRITE setConnectionType
               NOTIFY connectionTypeChanged)

public:
    explicit TcpConnection(QObject *parent = nullptr);

signals:

};

#endif // TCPCONNECTION_H

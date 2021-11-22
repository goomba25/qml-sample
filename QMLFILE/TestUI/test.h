#ifndef TEST_H
#define TEST_H

#include <QObject>
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonDocument>
#include <QHash>

class Test : public QObject
{
    Q_OBJECT
public:
    explicit Test(QObject *parent = nullptr);
    virtual ~Test();

    void getJson(QVariant data);
    void getHash();

    typedef QHash<int, QString> C_MODEL;
    typedef QVector<C_MODEL> C_MODEL_LIST;
signals:
    void updateState(QString jsonStr);

private:
    QJsonArray jsonValue1;
    QJsonObject jsonValue2;

    C_MODEL_LIST m_list;

    void setJson();
    void setHash();

private slots:
    void print(QString jsonStr);
};




#endif // TEST_H

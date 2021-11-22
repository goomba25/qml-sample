#include "test.h"

#include <QDebug>

Test::Test(QObject *parent) : QObject(parent)
{
    connect(this, &Test::updateState, this, &Test::print);
    setJson();
    getJson(jsonValue1);
    getJson(jsonValue2);
}

Test::~Test()
{}

void Test::getJson(QVariant data)
{
    QJsonArray json = data.toJsonArray();
    QJsonObject jsonObject = data.toJsonObject();

    if (!json.isEmpty())
    {
        QJsonDocument arrayToStringDoc(json);
        QString arrayString(arrayToStringDoc.toJson(QJsonDocument::Compact));
        qDebug() << "This is Json Array";
        emit updateState(arrayString);
    }
    else if (!jsonObject.isEmpty())
    {
        QJsonDocument objectToStringDoc(jsonObject);
        QString objectString(objectToStringDoc.toJson(QJsonDocument::Compact));
        qDebug() << "This is Json Object";
        emit updateState(objectString);
    }

//    for( auto jobject : jsonArray )
//    {
//        QJsonObject obj = jobject.toObject();

//        qDebug() << obj["id"].toString() << obj["type"].toString();

//        if( obj["content"].isObject() )
//        {
//            qDebug() << obj["content"].toObject();
//        }
//        else {
//            qDebug() << obj["content"].toString();
//        }
//    }
}

void Test::getHash()
{
}

void Test::setJson()
{
    QJsonObject json1;
    json1["id"] = "id1";
    json1["type"] = "hwstate1";
    json1["content"] = "this is content";

    QJsonObject json2;
    json2["id"] = "id2";
    json2["type"] = "hwstate2";

    QJsonObject jsonObject;
    jsonObject["type"] = "wifi";
    jsonObject["state"] = "online";
    jsonObject["strength"] = 10;
    json2["content"] = jsonObject;

    jsonValue1.append(json1);
    jsonValue1.append(json2);

    QJsonObject json3;
    json3["id"] = "id3";
    json3["type"] = "hwstate";
    json3["content"] = "this is content";

    jsonValue2 = json3;
}

void Test::setHash()
{
    C_MODEL data1;
    data1.insert(0, "string1");

    C_MODEL data2;
    data2.insert(0, "string2");

    C_MODEL data3;
    data3.insert(0, "string3");

    m_list.push_back(data1);
    m_list.push_back(data2);
    m_list.push_back(data3);
}

void Test::print(QString jsonStr)
{
    QJsonDocument json = QJsonDocument::fromJson(jsonStr.toUtf8());

    if (json.isArray())
    {
        QJsonArray array = json.array();

        for (auto itr : array)
        {
            QJsonObject jobject = itr.toObject();
            QString jsonID = jobject["id"].toString();

            if (jsonID.compare("id1") == 0)
            {
                qDebug() << jsonID << jobject["type"].toString();
            }
            else if (jsonID.compare("id2") == 0)
            {
                qDebug() << jsonID << jobject["type"].toString();
            }
        }
    }
    else if (json.isObject())
    {
        QJsonObject object = json.object();

        QString jsonID = object["id"].toString();

        if (jsonID.compare("id3") == 0)
        {
            qDebug() << jsonID << object["type"].toString();
        }
    }
}

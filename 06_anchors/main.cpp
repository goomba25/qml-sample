#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine1;
    const QUrl url1(QStringLiteral("qrc:/main1.qml"));
    const QUrl url2(QStringLiteral("qrc:/main2.qml"));
    QObject::connect(&engine1, &QQmlApplicationEngine::objectCreated,
                     &app, [url1](QObject *obj, const QUrl &objUrl) {
        if (!obj && url1 == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine1.load(url1);

    QQmlApplicationEngine engine2;
    QObject::connect(&engine2, &QQmlApplicationEngine::objectCreated,
                     &app, [url2](QObject *obj, const QUrl &objUrl) {
        if (!obj && url2 == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine2.load(url2);

    return app.exec();
}

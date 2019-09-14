#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "helpers/settings.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    bool isDebug = false;
    #ifdef QT_DEBUG
        isDebug = true;
    #endif

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    QScopedPointer<Settings> settings_ptr(new Settings(nullptr, isDebug));
    Settings * settings = settings_ptr.data();
    engine.rootContext()->setContextProperty("settings", settings);

    engine.load(url);
    return app.exec();
}

#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQmlProperty>

#include <QDebug>
#include <QObject>

#include "backend.hpp"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    
    Backend backend;


    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("backend", &backend);
    engine.load("main.qml");
    if (engine.rootObjects().isEmpty())
        return -1;
    
    QObject::connect(&backend, &Backend::textChanged, [](const QString &text){
            qDebug() << text;
    });
    return app.exec();
}

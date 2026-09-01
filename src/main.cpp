#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "app/ApplicationController.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    app.setApplicationName("DeskPet");
    app.setOrganizationName("DeskPet");

    ApplicationController controller;
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("applicationController", &controller);
    engine.loadFromModule("DeskPet", "Main");
    if (engine.rootObjects().isEmpty()) return -1;
    return app.exec();
}

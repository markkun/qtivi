TEMPLATE = lib
QT = ivicore ivivehiclefunctions
CONFIG += c++11 plugin

INCLUDEPATH += $$OUT_PWD/../frontend
LIBS += -L$$OUT_PWD/.. -l$$qtLibraryTarget(echo_frontend)

QFACE_FORMAT = qmlplugin
QFACE_SOURCES = ../../../org.example.echo.qface

load(ivigenerator)

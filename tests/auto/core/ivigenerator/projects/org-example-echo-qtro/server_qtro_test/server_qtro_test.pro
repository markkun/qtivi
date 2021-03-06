TARGET = tst_org-example-echo-qtro
QMAKE_PROJECT_NAME = $$TARGET
QT -= gui
QT += testlib ivicore iviremoteobjects_helper_private
LIBS += -L$$OUT_PWD/.. -l$$qtLibraryTarget(echo_frontend)

DESTDIR = ..

CONFIG += c++11 console ivigenerator testcase
CONFIG -= app_bundle

INCLUDEPATH += $$OUT_PWD/../frontend
INCLUDEPATH += $$OUT_PWD/../backend_qtro

SOURCES += main.cpp \
    server.cpp \
    echoservice.cpp \
    tst_echoqtro.cpp \
    echozonedservice.cpp \
    contactsmodelservice.cpp

QFACE_FORMAT = server_qtro
QFACE_SOURCES = ../../../org.example.echo.qface

HEADERS += \
    server.h \
    echoservice.h \
    tst_echoqtro.h \
    echozonedservice.h \
    contactsmodelservice.h

QMAKE_RPATHDIR += $$OUT_PWD/..
QMAKE_RPATHDIR += $$OUT_PWD/../qtivi

TARGET = chapter4-simulation-behavior
DESTDIR = ..

QT += qml quick
CONFIG -= app_bundle

SOURCES = main.cpp
RESOURCES += app.qrc \
             ../../images/images.qrc \

LIBS += -L$$OUT_PWD/../ -l$$qtLibraryTarget(QtIviInstrumentCluster)
INCLUDEPATH += $$OUT_PWD/../frontend
QMAKE_RPATHDIR += $ORIGIN

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = $$OUT_PWD/../frontend/qml

CONFIG += install_ok  # Do not cargo-cult this!
target.path = $$[QT_INSTALL_EXAMPLES]/ivicore/qface-tutorial/chapter4-simulation-behavior
INSTALLS += target

#-------------------------------------------------
#
# Project created by QtCreator 2019-03-13T08:56:22
#
#-------------------------------------------------

QT       += core gui
QT       += webenginewidgets
QT       += qml quick webview

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = avgMaker
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

CONFIG += c++11

SOURCES += \
        main.cpp \
    utils.cpp \
    main.cpp \
    utils.cpp \
    main.cpp \
    utils.cpp \
    main.cpp \
    utils.cpp \
    main.cpp \
    utils.cpp \
    tinystr.cpp \
    tinyxml.cpp \
    tinyxmlerror.cpp \
    tinyxmlparser.cpp


HEADERS += \
    utils.h \
    tinystr.h \
    tinyxml.h

FORMS +=

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    www/scripts/index.js \
    www/scripts/JavaScript.js \
    www/scripts/jquery-3.3.1.min.js \
    www/scripts/platformOverrides.js \
    www/xml/cut1.xml \
    www/xml/cut2.xml \
    www/xml/cut3.xml \
    www/xml/cut4.xml \
    www/xml/option1.xml \
    www/images/cordova.png \
    www/images/何君华.png \
    www/images/姚玉丹.png \
    www/images/街市-傍晚.png \
    www/images/街市-夜晚.png \
    www/css/index.css \
    www/index.html \
    www/scripts/index.js \
    www/scripts/JavaScript.js \
    www/scripts/jquery-3.3.1.min.js \
    www/scripts/platformOverrides.js \
    www/xml/cut1.xml \
    www/xml/cut2.xml \
    www/xml/cut3.xml \
    www/xml/cut4.xml \
    www/xml/option1.xml \
    icon/left-32.png \
    www/images/cordova.png \
    www/images/何君华.png \
    www/images/姚玉丹.png \
    www/images/街市-傍晚.png \
    www/images/街市-夜晚.png \
    www/css/index.css \
    www/index.html \
    ScriptInterpreter.py

RESOURCES += \
    mainwindow.qrc

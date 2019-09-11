#ifndef UTILS_H
#define UTILS_H

//#include <QApplication>
#include <QtCore/QUrl>
#include <QtCore/QCommandLineOption>
#include <QtCore/QCommandLineParser>
#include <QGuiApplication>
#include <QStyleHints>
#include <QScreen>
#include <QQmlApplicationEngine>
#include <QtQml/QQmlContext>
#include <QtWebView/QtWebView>
#include <QFileDialog>
#include <string>
#include <tinyxml.h>
#include <iostream>

using namespace std;

struct option{
    string script;
    string next;
};

class Utils : public QObject{
    Q_OBJECT
    vector<option> options;
public slots:
    void saveXML(QString fileName,QString fileContent);
    void SplitString(const string& s, vector<string>& v, const string& c);
    void saveOptionXML(QString fileName);
    void createOption(QStringList qscript,QStringList qnext);
};




#endif // UTILS_H

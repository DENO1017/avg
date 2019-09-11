#include "utils.h"

int main(int argc, char *argv[])
{
    //QApplication a(argc, argv);
    Utils* u = new Utils();


    QGuiApplication app(argc, argv);
    QtWebView::initialize();

    QGuiApplication::setApplicationDisplayName(QCoreApplication::translate("main",
                                                                           "avgMaker"));
    QCommandLineParser parser;
    QCoreApplication::setApplicationVersion(QT_VERSION_STR);
    //parser.setApplicationDescription(QGuiApplication::applicationDisplayName());
    //parser.addHelpOption();
    //parser.addVersionOption();
    parser.addPositionalArgument("url", "The initial URL to open.");
    QStringList arguments = app.arguments();
    parser.process(arguments);
    //const QString initialUrl = parser.positionalArguments().isEmpty() ?
    //    QStringLiteral("E:/srtp/gui_of_QT/avgMaker/www/index.html") : parser.positionalArguments().first();

    QQmlApplicationEngine engine;
    QQmlContext *context = engine.rootContext();
    //context->setContextProperty(QStringLiteral("utils"), new Utils(&engine));
    //context->setContextProperty(QStringLiteral("initialUrl"),
                                //Utils::fromUserInput(initialUrl));

    QRect geometry = QGuiApplication::primaryScreen()->availableGeometry();
    if (!QGuiApplication::styleHints()->showIsFullScreen()) {
        const QSize size = geometry.size() * 4 / 5;
        const QSize offset = (geometry.size() - size) / 2;
        const QPoint pos = geometry.topLeft() + QPoint(offset.width(), offset.height());
        geometry = QRect(pos, size);
    }


    context->setContextProperty(QStringLiteral("initialX"), geometry.x());
    context->setContextProperty(QStringLiteral("initialY"), geometry.y());
    context->setContextProperty(QStringLiteral("initialWidth"), geometry.width());
    context->setContextProperty(QStringLiteral("initialHeight"), geometry.height());
    context->setContextProperty(QStringLiteral("utils"), u);
/**/
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    //MainWindow w;
    //w.show();

    return app.exec();
}

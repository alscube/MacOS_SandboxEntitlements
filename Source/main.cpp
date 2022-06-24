
#include <QApplication>

#include "BookmarkExampleWidget.h"


int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    QCoreApplication::setOrganizationName("AlsCube");
    QCoreApplication::setApplicationName("EntitlementsExample");

    BookmarkExampleWidget widget;
    widget.show();

   return a.exec();
}

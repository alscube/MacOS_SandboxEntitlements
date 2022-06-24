#ifndef BOOKMARKEXAMPLEWIDGET_H
#define BOOKMARKEXAMPLEWIDGET_H

#include <QDialog>

namespace Ui {
class BookmarkExampleWidget;
}

class BookmarkExampleWidget : public QDialog
{
    Q_OBJECT

public:
    explicit BookmarkExampleWidget(QWidget *parent = nullptr);
    ~BookmarkExampleWidget();

private:
    Ui::BookmarkExampleWidget *ui;

    void OpenDialog( );
};

#endif // BOOKMARKEXAMPLEWIDGET_H

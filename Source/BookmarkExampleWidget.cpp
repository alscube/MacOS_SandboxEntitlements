
#include "BookmarkExampleWidget.h"
#include "ui_BookmarkExampleWidget.h"

#include <QSettings>
#include <QFileDialog>
#include "EntitlementBookmarks.h"

BookmarkExampleWidget::BookmarkExampleWidget(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::BookmarkExampleWidget)
{
    ui->setupUi(this);

    OpenDialog();
}

BookmarkExampleWidget::~BookmarkExampleWidget()
{
    delete ui;
}


void BookmarkExampleWidget::OpenDialog( )
{
    QSettings settings;
    QString userFolderPath( settings.value("UserFolderPath", "").toString() );
    ui->settingsEdit->setText( settings.fileName() );
    ui->resultLabel->setText(" ");

//    localDataPath.append( "/Preferences.ini" );
//    _settings = new QSettings( localDataPath, QSettings::IniFormat );

    EntitlementBookmarks bookmarks;

    if ( userFolderPath.isEmpty() )
    {   // if no path was selected by user, ask user that then creates the Bookmark

        // get bookmark from open folder dialog
        userFolderPath = QFileDialog::getExistingDirectory( this, tr("Select folder"), userFolderPath, QFileDialog::ShowDirsOnly | QFileDialog::DontResolveSymlinks );
        // or call
        // bookmarks.CreateBookmark( userFolderPath );
        if( userFolderPath.isEmpty() )
            return;

        bookmarks.SaveBookmark( userFolderPath );
        settings.setValue("UserFolderPath", userFolderPath );
    }
    else
    {   // if there is a path selected by the user then restore the entitlement
        
        bookmarks.RestoreBookmark( userFolderPath );
    }

    // Test access
    QString fullPath( userFolderPath + "/TestFile" );
    QFile testFile( fullPath );
    if ( testFile.open(QIODeviceBase::ReadWrite) )
        ui->resultLabel->setText( QString( "%1 is open" ).arg(fullPath) );
    else
        ui->resultLabel->setText( QString( "%1 is NOT open" ).arg(fullPath) );
}

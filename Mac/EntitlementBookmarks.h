
// EntitlementBookmarks.h

#include <QString>

class EntitlementBookmarks
{
public:
    EntitlementBookmarks( );

    void CreateBookmark( QString& folderPath );
    void SaveBookmark( const QString& folderPath );
    bool RestoreBookmark( QString& folderPath );
};

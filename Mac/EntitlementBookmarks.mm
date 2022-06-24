
// EntitlementBookmarks.mm

#include "EntitlementBookmarks.h"

#include <AppKit/AppKit.h>
#include <Foundation/Foundation.h>

#include <QString>


// This code is designed to bookmark FOLDERS.
// Specific files can be bookmarked as well, see NSURLBookmarkCreationOptions.

// The bookmark stays active until the application is closed.

// Release bookmarked resouces file open constanly open and close them.
// See stopAccessingSecurityScopedResource

// Apple's Warning :
// If you fail to relinquish your access to file-system resources when you no
// longer need them, your app leaks kernel resources. If sufficient kernel
// resources are leaked, your app loses its ability to add file-system locations
// to its sandbox, such as via Powerbox or security-scoped bookmarks, until relaunched.


EntitlementBookmarks::EntitlementBookmarks( )
{
}


void EntitlementBookmarks::CreateBookmark( QString& folderPath )
{
    NSOpenPanel * panel = [NSOpenPanel openPanel];

    [panel setCanChooseDirectories:YES];
    [panel setCanCreateDirectories:YES];
    [panel setCanChooseFiles:NO];
    [panel setAllowsMultipleSelection:NO];
    [panel setResolvesAliases:YES];
    [panel setTreatsFilePackagesAsDirectories:YES];
    [panel setMessage:@"Please choose an image file."];
    [panel runModal];

    NSURL *panelURL = [panel URL];
    NSString* nsFolderPath = [panelURL path];
    folderPath = [nsFolderPath UTF8String];
}


void EntitlementBookmarks::SaveBookmark( const QString& folderPath )
{
    NSString* s = [[NSString alloc] initWithUTF8String:folderPath.toUtf8()];
    NSURL* nsURL = [NSURL fileURLWithPath:s];
    
    NSError *error = nil;

    NSData *bookmark = [nsURL bookmarkDataWithOptions:NSURLBookmarkCreationWithSecurityScope
            includingResourceValuesForKeys:nil
            relativeToURL:nil
            error:&error];

    if (error) {
        // if you get this error you may not running within the App SandBox,
        // make sure to setup in Signing & Capabilities in Xcode
        // domain: "NSCocoaErrorDomain" - code: 256
    }
    else
    {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [ userDefaults setObject:bookmark forKey:@"savedBookmark"];
    }
}


bool EntitlementBookmarks::RestoreBookmark( QString& folderPath )
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *bookmark = [userDefaults dataForKey:@"savedBookmark" ];

    NSError *error = nil;
    BOOL isStale = NO;

    NSURL* fileFolderURL = [NSURL URLByResolvingBookmarkData:bookmark
                                                    options:NSURLBookmarkResolutionWithSecurityScope
                                              relativeToURL:nil
                                        bookmarkDataIsStale:&isStale
                                                      error:&error];

    if(error != nil)
    {
        folderPath.clear();
        return false;
    }
    else
    {
        NSString* nsFolderPath = [fileFolderURL path];
        folderPath = [nsFolderPath UTF8String];
    
    }
    
    BOOL success = [fileFolderURL startAccessingSecurityScopedResource];
    if ( !success )
    {
        [fileFolderURL stopAccessingSecurityScopedResource];
        folderPath.clear();
        return false;
    }
        
    return true;
}


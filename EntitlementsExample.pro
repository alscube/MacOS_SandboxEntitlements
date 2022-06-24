
# EntitlementsExample.pro

TARGET = EntitlementsExample

QT += core
QT += gui
QT += widgets

CONFIG += c++11

MOC_DIR = $$OUT_PWD/build
OBJECTS_DIR = $$OUT_PWD/build
UI_DIR = $$OUT_PWD/build
DESTDIR = $$PWD/Debug

message( PWD : $$PWD )
message( OUT_PWD : $$OUT_PWD )
message( MOC_DIR : $$MOC_DIR )
message( UI_DIR :  $$UI_DIR )
message( OBJECTS_DIR : $$OBJECTS_DIR )
message( DESTDIR : $$DESTDIR )


INCLUDEPATH += \
    ./Mac

SOURCES += \
    Source/main.cpp \
    Source/BookmarkExampleWidget.cpp \

HEADERS += \
    Source/BookmarkExampleWidget.h \

FORMS += \
    Source/BookmarkExampleWidget.ui \

mac {
    OBJECTIVE_HEADERS *= Mac/EntitlementBookmarks.h
    OBJECTIVE_SOURCES *= Mac/EntitlementBookmarks.mm

    QMAKE_LFLAGS *= "-Wl,-rpath,@executable_path/../Frameworks"

    QMAKE_TARGET_BUNDLE_PREFIX = com.alscube

    Q_GENERATE_DEBUGGING_FORMAT.name = GCC_GENERATE_DEBUGGING_SYMBOLS
    Q_GENERATE_DEBUGGING_FORMAT.value = YES
    QMAKE_MAC_XCODE_SETTINGS += Q_GENERATE_DEBUGGING_FORMAT

    debug_information_format.name = DEBUG_INFORMATION_FORMAT
    debug_information_format.value = dwarf-with-dsym
    QMAKE_MAC_XCODE_SETTINGS += debug_information_format

    FULL_APP_PATH_NAME = $$PWD/Debug/EntitlementsExample.app
    QMAKE_POST_LINK += $$quote($$[QT_INSTALL_BINS]/macdeployqt $$FULL_APP_PATH_NAME -always-overwrite)
}

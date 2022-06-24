#############################################################################
# Makefile for building: Debug/EntitlementsExample.app/Contents/MacOS/EntitlementsExample
# Generated by qmake (3.1) (Qt 6.2.3)
# Project:  EntitlementsExample.pro
# Template: app
# Command: /Users/user/Qt/6.2.3/6.2.3/macos/bin/qmake -o EntitlementsExample.xcodeproj/project.pbxproj EntitlementsExample.pro -spec macx-xcode CONFIG+=debug
#############################################################################

MAKEFILE      = project.pbxproj

EQ            = =

MOC       = /Users/user/Qt/6.2.3/6.2.3/macos/libexec/moc
UIC       = /Users/user/Qt/6.2.3/6.2.3/macos/libexec/uic
LEX       = flex
LEXFLAGS  = 
YACC      = yacc
YACCFLAGS = -d
DEFINES       = -DQT_WIDGETS_LIB -DQT_GUI_LIB -DQT_CORE_LIB
INCPATH       = -I. -IMac -I../../../../Qt/6.2.3/6.2.3/macos/lib/QtWidgets.framework/Headers -I../../../../Qt/6.2.3/6.2.3/macos/lib/QtGui.framework/Headers -I../../../../Qt/6.2.3/6.2.3/macos/lib/QtCore.framework/Headers -Ibuild -I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX12.3.sdk/System/Library/Frameworks/OpenGL.framework/Headers -I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX12.3.sdk/System/Library/Frameworks/AGL.framework/Headers -Ibuild -I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX12.3.sdk/System/Library/Frameworks/OpenGL.framework/Headers -I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX12.3.sdk/System/Library/Frameworks/AGL.framework/Headers -I../../../../Qt/6.2.3/6.2.3/macos/mkspecs/macx-clang -F/Users/user/Qt/6.2.3/6.2.3/macos/lib
DEL_FILE  = rm -f
MOVE      = mv -f

preprocess: compilers
clean preprocess_clean: compiler_clean

mocclean: compiler_moc_header_clean compiler_moc_objc_header_clean compiler_moc_source_clean

mocables: compiler_moc_header_make_all compiler_moc_objc_header_make_all compiler_moc_source_make_all

check: first

benchmark: first

compilers: build/moc_BookmarkExampleWidget.cpp build/ui_BookmarkExampleWidget.h
compiler_rcc_make_all:
compiler_rcc_clean:
compiler_moc_header_make_all: build/moc_BookmarkExampleWidget.cpp
compiler_moc_header_clean:
	-$(DEL_FILE) build/moc_BookmarkExampleWidget.cpp
build/moc_BookmarkExampleWidget.cpp: Source/BookmarkExampleWidget.h \
		../../../../Qt/6.2.3/6.2.3/macos/lib/QtWidgets.framework/Headers/QDialog \
		../../../../Qt/6.2.3/6.2.3/macos/libexec/moc
	/Users/user/Qt/6.2.3/6.2.3/macos/libexec/moc $(DEFINES) -D__APPLE__ -D__GNUC__=4 -D__APPLE_CC__ -D__cplusplus=199711L -D__APPLE_CC__=6000 -D__clang__ -D__clang_major__=13 -D__clang_minor__=1 -D__clang_patchlevel__=6 -D__GNUC__=4 -D__GNUC_MINOR__=2 -D__GNUC_PATCHLEVEL__=1 -I/Users/user/Qt/6.2.3/6.2.3/macos/mkspecs/macx-clang -I/Users/user/Workspace/Projects/AlsCube/EntitlementsExample -I/Users/user/Workspace/Projects/AlsCube/EntitlementsExample/Mac -I/Users/user/Qt/6.2.3/6.2.3/macos/lib/QtWidgets.framework/Headers -I/Users/user/Qt/6.2.3/6.2.3/macos/lib/QtGui.framework/Headers -I/Users/user/Qt/6.2.3/6.2.3/macos/lib/QtCore.framework/Headers -I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX12.3.sdk/usr/include/c++/v1 -I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/include -I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX12.3.sdk/usr/include -I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include -F/Users/user/Qt/6.2.3/6.2.3/macos/lib Source/BookmarkExampleWidget.h -o build/moc_BookmarkExampleWidget.cpp

compiler_moc_objc_header_make_all:
compiler_moc_objc_header_clean:
compiler_moc_source_make_all:
compiler_moc_source_clean:
compiler_uic_make_all: build/ui_BookmarkExampleWidget.h
compiler_uic_clean:
	-$(DEL_FILE) build/ui_BookmarkExampleWidget.h
build/ui_BookmarkExampleWidget.h: Source/BookmarkExampleWidget.ui \
		../../../../Qt/6.2.3/6.2.3/macos/libexec/uic
	/Users/user/Qt/6.2.3/6.2.3/macos/libexec/uic Source/BookmarkExampleWidget.ui -o build/ui_BookmarkExampleWidget.h

compiler_rez_source_make_all:
compiler_rez_source_clean:
compiler_yacc_decl_make_all:
compiler_yacc_decl_clean:
compiler_yacc_impl_make_all:
compiler_yacc_impl_clean:
compiler_lex_make_all:
compiler_lex_clean:
compiler_clean: compiler_moc_header_clean compiler_uic_clean 

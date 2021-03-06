######################################################################
# Automatically generated by qmake (2.01a) Thu Nov 19 17:10:38 2009
######################################################################

TEMPLATE = app
TARGET = tilemqt
DEPENDPATH += .
INCLUDEPATH += .

QT += script

DESTDIR = $$PWD

CONFIG += debug

#DEFINES += TILEM_QT_LINK_DEBUG

!disable_link:!win32:system(pkg-config --exists ticonv tifiles2 ticables2 ticalcs2):CONFIG *= enable_link

# link support
enable_link {
	DEFINES += _TILEM_QT_HAS_LINK_
	
	# Windows hackish way
	win32 {
		# tilibs depend on glib...
		INCLUDEPATH += d:\prog\gtk\include \
                               d:\prog\gtk\include\glib-2.0 \
                               d:\prog\gtk\lib\glib-2.0\include \

		LIBS += -Ld:\prog\gtk\lib \
                        -lglib-2.0.dll
		
		# tilibs are so f****** troublesome to build under Win ...
		# provide bins and hardcode pathes...
		LIBS += -L..\..\tilibs2-build \
                        -lticonv -ltifiles2 -lticables2 -lticalcs2
                
                DEFINES += HAVE_STDINT_H
                
		INCLUDEPATH += ..\..\libticonv\src \
                               ..\..\libtifiles\src \
                               ..\..\libticables\src \
                               ..\..\libticalcs\src
	} else {
		# *nix clean way : forward the job to pkg-config
		CONFIG += link_pkgconfig
		PKGCONFIG += ticalcs2
	}
}

# Input
HEADERS += \
	tilemqt.h \
	calc.h \
	calclink.h \
	settings.h \
	calcview.h \
	calcgrid.h \
	calcgridmanager.h \
	connectionmanager.h \
	calcdebugger.h \
	calclogview.h \
	calchexvalue.h \
	calcflags.h \
	keymap.h \
	keymaploader.h

SOURCES += main.cpp \
	tilemqt.cpp \
	calc.cpp \
	calclink.cpp \
	settings.cpp \
	calcview.cpp \
	calcgrid.cpp \
	calcgridmanager.cpp \
	connectionmanager.cpp \
	calcdebugger.cpp \
	calclogview.cpp \
	keymap.cpp \
	keymaploader.cpp \
	tilemkeymap.cpp

FORMS += calcdebugger.ui

UIC_DIR = .build
RCC_DIR = .build
MOC_DIR = .build
OBJECTS_DIR = .build

INCLUDEPATH += ../emu ../db

LIBS += -L../emu -L../db -ltilemcore -ltilemdb

PRE_TARGETDEPS += ../emu/libtilemcore.a ../db/libtilemdb.a

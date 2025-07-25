QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    main.cpp \
    useless.cpp

HEADERS += \
    useless.h

FORMS += \
    useless.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


# Copy static files to output directory
STATIC_FILES_DIR = $$PWD/static
DEST_DIR = $$OUT_PWD/static

# Ensure the destination directory exists
win32 {
    QMAKE_POST_LINK += if not exist $$shell_quote($$shell_path($$DEST_DIR)) mkdir $$shell_quote($$shell_path($$DEST_DIR)) &&
    QMAKE_POST_LINK += $$QMAKE_COPY_DIR $$shell_quote($$shell_path($$STATIC_FILES_DIR)) $$shell_quote($$shell_path($$DEST_DIR))
} else:unix {
    QMAKE_POST_LINK += mkdir -p $$shell_quote($$shell_path($$DEST_DIR)) &&
    QMAKE_POST_LINK += $$QMAKE_COPY_DIR $$shell_quote($$shell_path($$STATIC_FILES_DIR)) $$shell_quote($$shell_path($$DEST_DIR))
}

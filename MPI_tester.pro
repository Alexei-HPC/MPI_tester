QT += core
QT -= gui

CONFIG += c++11

TARGET = MPI_tester
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

win32:INCLUDEPATH += "C:/Program Files (x86)/MPICH2/include/"

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


SOURCES += main.cpp

win32:LIBS += -L/"C:/Program Files (x86)/MPICH2/lib" -lmpich2 -lopa -lpthread -lrt

win32:CONFIG(release, debug|release): LIBS += -L'C:/Program Files (x86)/MPICH2/lib/' -lmpich2
else:win32:CONFIG(debug, debug|release): LIBS += -L'C:/Program Files (x86)/MPICH2/lib/' -lmpich2d

unix: LIBS += -L/usr/lib/openmpi/lib -lmpi -lmpi++

win32:INCLUDEPATH += 'C:/Program Files (x86)/MPICH2/include'
win32:DEPENDPATH += 'C:/Program Files (x86)/MPICH2/include'
unix:DEPENDPATH += /usr/lib/openmpi/lib
unix:INCLUDEPATH += /usr/lib/openmpi/include

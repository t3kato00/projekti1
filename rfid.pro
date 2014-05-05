#-------------------------------------------------
#
# Project created by QtCreator 2014-04-28T17:06:12
#
#-------------------------------------------------

QT -= gui

TARGET = rfid_reader_dll
TEMPLATE = lib

DEFINES += RFID_READER_DLL_LIBRARY

SOURCES += rfid/rfid_reader.cpp
SOURCES += rfid/rfid_reader_dll.cpp

HEADERS += rfid/rfid_reader.h
HEADERS += rfid/rfid_reader_dll.h
HEADERS += rfid/rfid_reader_global.h



win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../build-qextserialport-Desktop_Qt_5_2_1_MinGW_32bit-Release/release/ -lQt5ExtSerialPort1
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../build-qextserialport-Desktop_Qt_5_2_1_MinGW_32bit-Release/debug/ -lQt5ExtSerialPort1
else:unix: LIBS += -L$$PWD/../build-qextserialport-Desktop_Qt_5_2_1_MinGW_32bit-Release/ -lQt5ExtSerialPort1

INCLUDEPATH += $$PWD/../build-qextserialport-Desktop_Qt_5_2_1_MinGW_32bit-Release/release
DEPENDPATH += $$PWD/../build-qextserialport-Desktop_Qt_5_2_1_MinGW_32bit-Release/release

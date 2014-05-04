#-------------------------------------------------
#
# Project created by QtCreator 2014-04-15T10:13:55
#
#-------------------------------------------------

QT       += core gui sql
 QMAKE_CXXFLAGS += -std=c++11
QT += network
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = inventaari
TEMPLATE = app

QMAKE_CXXFLAGS += --std=c++11

SOURCES += main.cpp \
    ui/mainwindow.cpp \
    ui/mainmenu/mainmenu.cpp \
    ui/login/loginpage.cpp \
    rfid/rfid_reader.cpp \
    ui/products/product_management.cpp \
    db/products/product_model.cpp \
    ui/sales/sale.cpp \
    ui/users/user.cpp \
    db/products/product.cpp \
    db/utilities.cpp \
    db/sales/sales_row.cpp \
    db/sales/sales_event.cpp \
    ui/sales/sales_tracking.cpp \
    rfid/rfid_reader_dll/rfid_reader_dll.cpp

HEADERS  += \
    ui/mainwindow.h \
    ui/mainmenu/mainmenu.h \
    ui/login/loginpage.h \
    rfid/rfid_reader.h \
    ui/products/product_management.h \
    db/products/product_model.h \
    ui/sales/sale.h \
    ui/users/user.h \
    db/products/product.h \
    db/utilities.h \
    db/sales/sales_row.h \
    db/sales/sales_event.h \
    ui/sales/sales_tracking.h \
    rfid/rfid_reader_dll/rfid_reader_dll.h \
    rfid/rfid_reader_dll/rfid_reader_dll_global.h

RESOURCES += \
    resource.qrc

FORMS += \
    ui/products/product_management.ui \
    ui/mainmenu/mainmenu.ui \
    ui/login/loginpage.ui \
    ui/sales/sale.ui \
    ui/users/user.ui \
    ui/sales/sales_tracking.ui


INCLUDEPATH += $$PWD/qextserial
DEPENDPATH += $$PWD/qextserial

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../build-qextserialport-Desktop_Qt_5_2_1_MinGW_32bit-Release/release/ -lQt5ExtSerialPort1
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../build-qextserialport-Desktop_Qt_5_2_1_MinGW_32bit-Release/debug/ -lQt5ExtSerialPort1
else:unix: LIBS += -L$$PWD/../build-qextserialport -lQt5ExtSerialPort

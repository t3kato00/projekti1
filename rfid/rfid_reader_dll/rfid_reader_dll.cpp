#include "Rfid_reader_dll.h"
#include <stdio.h>
#include <QObject>
#include <QTimer>
#include "../../ui/login/loginpage.h"
#include <QtSql/QSql>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlDriver>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlRecord>

Rfid_reader_dll::Rfid_reader_dll(QString pPort)
{
    portName = pPort;
    QObject::connect(&timer,SIGNAL(timeout()),this,SLOT(tick()));
}

bool Rfid_reader_dll::openCOMPort()
{
    serialPort.setPortName(portName);
    serialPort.setQueryMode(QextSerialPort::EventDriven);
    serialPort.setBaudRate(BAUD9600);
    serialPort.setFlowControl(FLOW_HARDWARE);
    serialPort.setParity(PAR_NONE);
    serialPort.setDataBits(DATA_8);
    serialPort.setStopBits(STOP_1);
    bool returnValue = serialPort.open(QIODevice::ReadWrite);
    return returnValue;
}

void Rfid_reader_dll::closeCOMPort()
{
    serialPort.close();
}

void Rfid_reader_dll::tick()
{

    if(ending)
    {
        serialPort.read(10);
        timer.stop();
        closeCOMPort();
    }
    if(!first)
    {
        QString hexNum, cardSerialNumber;
        char data[11], temp[11];
        int bytesRead;

        bytesRead = serialPort.read(data,10);
        data[bytesRead] = '\0';
        if (bytesRead > 0)
        {
            for(int i=0;i<5;i++)
            {
                sprintf(temp,"%08X", data[i]);
                hexNum = temp;
                cardSerialNumber = cardSerialNumber + hexNum.right(2);
            }
           if(cardSerialNumber.at(0)==QChar('8'))
           {
               cardSerialNumber = "";
           }

        }else
        {
         cardSerialNumber = "";
        }
        if(cardSerialNumber=="")
        {
            if(missess>=3)
            {
                if(prevRFID!="")
                    emit norfid();
                prevRFID = "";
            }else
            {
                missess++;
            }
        }else
        {
            missess = 0;
            if(cardSerialNumber==prevRFID)
            {

            }else
            {
                prevRFID = cardSerialNumber;
                QSqlQuery check_id;
                check_id.prepare("SELECT * FROM users;");
                check_id.exec();
                while(check_id.next()){

                   if(prevRFID == check_id.record().value(2))
                        {
                            emit rfid(prevRFID);
                        }
                }
            }
        }
    }
    serialPort.write("U",1);
}
bool Rfid_reader_dll::start()
{
    if(openCOMPort())
    {
        timer.setInterval(1000);
        timer.start(1000);
        first = false;
        missess = 0;
        ending = false;
        return true;
    }
    return false;
}
void Rfid_reader_dll::stop()
{
   ending = true;

}

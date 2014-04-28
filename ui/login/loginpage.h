#ifndef LOGINPAGE_H
#define LOGINPAGE_H

#include <QDialog>
#include "rfid/rfid_reader.h"
#include <functional>

namespace Ui {
class loginpage;
}

class loginpage : public QDialog
{
    Q_OBJECT

public:
    explicit loginpage(QWidget *parent = 0);
    ~loginpage();
    rfid_reader * rfReader;
    bool reading_rfid;
    std::function<void(QString)>read_rfid_handler;
    void read_rfid( std::function<void(QString)> h );

private:
    Ui::loginpage *ui;
public slots:
    void sendLogin();
    void rfid_noup();
    void rfid_ok(QString);

signals:
    void loginClicked(int);
};

#endif // LOGINPAGE_H

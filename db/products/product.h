#ifndef PRODUCT_H
#define PRODUCT_H

#include <qstring.h>

class product
{
public:
    product();
    ~product(){}
    void set_data(QString);
//private:
    QString code;
    QString name;
    double price;
    int stock;
};

#endif // PRODUCT_H

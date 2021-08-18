#ifndef STYLEHELPER_H
#define STYLEHELPER_H

#include <QObject>

class StyleHelper : public QObject
{
    Q_OBJECT

public:
    explicit StyleHelper(QObject *parent = nullptr);

    Q_INVOKABLE QString theme();
    Q_INVOKABLE void setTheme(QString theme);
};

#endif // STYLEHELPER_H

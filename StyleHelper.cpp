#include "StyleHelper.h"

#include <QSettings>

StyleHelper::StyleHelper(QObject *parent)
    : QObject{parent}
{
}

QString StyleHelper::theme()
{
    QSettings settings;
    return settings.value("theme", "Universal").toString();
}

void StyleHelper::setTheme(QString theme)
{
    QSettings settings;
    settings.setValue("theme", theme);
}

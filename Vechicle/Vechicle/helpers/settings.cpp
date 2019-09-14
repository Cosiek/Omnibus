#include "settings.h"

Settings::Settings(QObject *parent, bool isDebug)
    : QObject(parent)
{
    this->isDebug = isDebug;
    QSettings t("Cosiek Inc.", "OmnibusVechicle");
}

bool Settings::getIsDebug(){
    return this->isDebug;
}

void Settings::set(QString key, QVariant val){
    this->t.setValue(key, val);
}

QVariant Settings::get(QString key){
    return this->t.value(key);
}

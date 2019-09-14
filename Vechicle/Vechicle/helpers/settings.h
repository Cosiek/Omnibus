#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>
#include <QSettings>

class Settings : public QObject
{
    Q_OBJECT
public:
    explicit Settings(QObject *parent = nullptr, bool isDebug = false);

    Q_INVOKABLE void set(QString, QVariant);
    Q_INVOKABLE QVariant get(QString);
    Q_INVOKABLE bool getIsDebug();
private:
    bool isDebug;
    QSettings t;
signals:

public slots:
};

#endif // SETTINGS_H

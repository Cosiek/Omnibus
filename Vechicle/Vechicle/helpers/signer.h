#ifndef SIGNER_H
#define SIGNER_H

#include <QObject>
#include <QMessageAuthenticationCode>

class Signer : public QObject
{
    Q_OBJECT
public:
    explicit Signer(QObject *parent = nullptr);

    Q_INVOKABLE QString getSignature(QString);
    Q_INVOKABLE QString obscure(QString);
    Q_INVOKABLE bool hasKey();
    Q_INVOKABLE QString getIdentifierFromFile();
private:
    QCryptographicHash::Algorithm algorithm;
    QString key;
    QString obscureKey;
    QString getKeyFromFile();
    QString getObscureKeyFromFile();
signals:

public slots:
};

#endif // SIGNER_H

#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QMessageAuthenticationCode>
#include <QTextStream>

#include "signer.h"

Signer::Signer(QObject *parent) : QObject(parent){
    this->algorithm = QCryptographicHash::Md5;
    this->key = this->getKeyFromFile();
}


QString Signer::getSignature(QString dataJson){
    // unpack
    QJsonDocument jsonDocument(QJsonDocument::fromJson(dataJson.toUtf8()));
    QJsonObject ob = jsonDocument.object();
    // prepare data
    QString dt = "";
    QStringList keys = ob.keys();
    keys.sort();
    QString k;
    for (int i = 0; i < keys.size(); ++i){
        k = keys[i];
        if (ob.value(k).isString()){
            dt += k + ob.value(k).toString();
        } else if (ob.value(k).isDouble()) {
            dt += k + QString::number(ob.value(k).toDouble(), 'g', 15);
        }
    }
    // generate signature
    QMessageAuthenticationCode code(this->algorithm);
    code.setKey(this->key.toUtf8());
    code.addData(dt.toUtf8());
    return code.result().toHex();
}

QString Signer::obscure(QString password, QString key){
    QMessageAuthenticationCode code(this->algorithm);
    code.setKey(key.toUtf8());
    code.addData(password.toUtf8());
    return code.result().toHex();
}

QString getFileContent(QString path){
    QFile file(path);
    QString fileContent;
    if ( file.open(QIODevice::ReadOnly) ) {
        QString line;
        QTextStream t( &file );
        do {
            line = t.readLine();
            fileContent += line;
        } while (!line.isNull());
        file.close();
    } else {
        return QString();
    }
    return fileContent;
}

QString Signer::getKeyFromFile(){
    // TODO: consider moving file name elsewhere
    return getFileContent("v_scrt.txt");
}

QString Signer::getIdentifierFromFile(){
    // TODO: consider moving file name elsewhere
    return getFileContent("v_id.txt");
}


bool Signer::hasKey(){
    return this->key.length() > 0;
}

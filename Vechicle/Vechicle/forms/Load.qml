import QtQuick 2.4
import QtQuick.Controls 2.1

import "../lib/HttpRequest.js" as HttpRequest


LoadForm {

    StackView.onActivated: {
        // check if key file is loaded
        var sendRequest = true;
        if (!signer.hasKey()){
            loadFormBusyIndicator.running = false;
            loadFormText.text = "Can't find key file!"
            sendRequest = false;
        } else {
            loadFormText.text = "Key file found...moving on."
        }
        // check if identifier file is present
        var identifier = signer.getIdentifierFromFile();
        if (!identifier){
            loadFormText.text += "\nCan't find identifier file!";
            sendRequest = false;
        } else {
            loadFormText.text += "\nIdentifier file found...moving on."
        }

        // check internet access
        if (sendRequest){
            HttpRequest.send(
                 "/device/hello",
                 {},
                 function(xhr){ stackView.push("Login.qml") },
                 function(xhr){
                     if (xhr.status === 0){
                         loadFormBusyIndicator.running = false;
                         loadFormText.text += "\nNo connection :(";
                         stackView.push("Login.qml");
                     } else {
                         stackView.push("Login.qml");
                     }
                 }
            );
        } else {
            loadFormText.text += "\nCan't go on until these issues are fixed.";
        }
    }
}

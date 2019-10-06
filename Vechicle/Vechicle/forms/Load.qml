import QtQuick 2.4
import QtQuick.Controls 2.1

import "../lib/HttpRequest.js" as HttpRequest


LoadForm {

    StackView.onActivated: {
        // check if key file is loaded
        if (!signer.hasKey()){
            loadFormBusyIndicator.running = false;
            loadFormText.text = "Can't find key file!"
        } else {
            loadFormText.text = "Key file found...moving on."
        }
        // check if identifier file is present
        var identifier = signer.getIdentifierFromFile();
        if (!identifier){
            loadFormText.text += "\nCan't find identifier file!";
        } else {
            loadFormText.text += "\nIdentifier file found...moving on."
        }

        // check internet access
        HttpRequest.send(
             "/device/drivers",
             {},
             function(xhr){
                 var d = JSON.parse(xhr.responseText);
                 stackView.push("Login.qml",
                    {'drivers': d.drivers, 'preferredDrivers': d.preferred}
                 );
             },
             function(xhr){
                 // TODO: check response status!
                 loadFormText.text += "\nNo connection :("
             }
        );
    }
}

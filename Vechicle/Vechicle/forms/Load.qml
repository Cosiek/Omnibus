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
        // check internet access
        HttpRequest.send(
             "/device/validate",
             {"say": "Hello!"},
             function(xhr){ loadFormText.text = xhr.responseText },
             function(xhr){ loadFormText.text = "No connection :(" }
        );
    }
}

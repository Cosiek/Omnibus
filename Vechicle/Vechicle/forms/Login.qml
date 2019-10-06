import QtQuick 2.4
import QtQuick.Controls 2.1

import "../lib/HttpRequest.js" as HttpRequest

LoginForm {

    function lockForm(){
        // block inputs
        loginButton.enabled = false;
        loginComboBox.enabled = false;
        passwordInput.enabled = false;
        // start spinner
        busyIndicator.running = true;
        // clear status
        statusText.text = '';
    }

    function unlockForm(){
        // stop spinner
        busyIndicator.running = false;
        // unlock inputs
        loginButton.enabled = true;
        loginComboBox.enabled = true;
        passwordInput.enabled = true;
    }

    StackView.onActivated: {
        // prepare success callback
        function success(xhr){
            // clear previous answers
            loginComboBox.model.clear()
            // parse response
            var response = JSON.parse(xhr.responseText);
            // add preffered drivers to combo box
            for (var idx in response.preferred){
                var d = response.preferred[idx]
                loginComboBox.model.append({text: d, id: d })
            }
            // add other drivers to combo box
            for (idx in response.drivers){
                d = response.drivers[idx]
                if (response.preferred.indexOf(d) === -1){
                    loginComboBox.model.append({text: d, id: d })
                }
            }
            // set combo box selected item
            loginComboBox.currentIndex = 0;
            // unlock inputs
            unlockForm();
            // focus on password field
            passwordInput.forceActiveFocus();
        }

        // prepare fial callback
        function fial(xhr){
            unlockForm();
            // display apropriate message
            if (xhr.status === 0){
                // connection failed - inform we're going offline
                statusText.text = "Connection to srver failed."
                statusText.text +="\nWrite login by hand."
            }
        }

        // ask the server for drivers list
        lockForm();
        HttpRequest.send("/device/drivers", {}, success, fial);
    }
}

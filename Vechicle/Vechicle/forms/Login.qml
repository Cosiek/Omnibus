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
        // clear any previous inputed passwords
        passwordInput.text = '';
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
                statusText.text = "Connection to server failed."
                statusText.text +="\nWrite login by hand."
            }
        }

        // ask the server for drivers list
        lockForm();
        HttpRequest.send("/device/drivers", {}, success, fial);
    }

    loginButton.onClicked: {
        console.log("Clicked")
        lockForm();
        // prepare data
        var data = {
            'login': loginComboBox.model.get(loginComboBox.currentIndex).id,
            'password': passwordInput.text,  // TODO: obscurify
        }
        // prepare success callback
        function success(xhr){
            statusText.text = "Login successful."
            // clear password
            passwordInput.text = '';
            // TODO: go further
        }
        // prepare fial calback
        function fial(xhr){
            if (xhr.status === 0 || xhr.status === 502){  // no server
                statusText.text = "Connection to server failed.";
                statusText.text +="\nTry again?";
            } else if (xhr.status === 403){  // forbidden
                statusText.text = "Wrong login or password.";
            }
            unlockForm();
        }

        HttpRequest.send("/device/login", data, success, fial);
    }
}

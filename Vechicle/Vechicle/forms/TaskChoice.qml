import QtQuick 2.4
import QtQuick.Controls 2.1

import "../lib/HttpRequest.js" as HttpRequest

TaskChoiceForm {

    function lockForm(){
        console.log("lock")
        submitButton.enabled = false;
        technicalDriveButton.enabled = false;
        brigadeChoiceComboBox.enabled = false;
        lineChoiceComboBox.enabled = false;
    }

    function unlockForm(){
        console.log("lock")
        submitButton.enabled = true;
        technicalDriveButton.enabled = true;
        brigadeChoiceComboBox.enabled = true;
        lineChoiceComboBox.enabled = true;
    }

    StackView.onActivated: {
        console.log("onActivated")
        lockForm()
        // download tasks =============

        // prepare success callback
        function success(xhr){}
        // prepare fial callback
        function fial(xhr){}

        // send request
        HttpRequest.send("/device/tasks", {}, success, fial);
    }
}

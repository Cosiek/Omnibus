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
        function success(xhr){
            // clear previous answers
            lineChoiceComboBox.model.clear()
            brigadeChoiceComboBox.model.clear()
            // parse response
            var response = JSON.parse(xhr.responseText);
            // add preffered task to combo boxes
            if (response.preferred !== null){
                var d = response.preferred[0]
                lineChoiceComboBox.model.append({text: d, id: d })
                lineChoiceComboBox.currentIndex = 0;
                d = response.preferred[1]
                brigadeChoiceComboBox.model.append({text: d, id: d })
                brigadeChoiceComboBox.currentIndex = 0;
            }
            // add lines to combobox
            for (var name in response.tasks){
                if (response.preferred !== null && name === response.preferred[0]){
                    continue
                }
                lineChoiceComboBox.model.append({text: name, id: name })
            }
            unlockForm()
        }
        // prepare fial callback
        function fial(xhr){ unlockForm() }

        // send request
        HttpRequest.send("/device/tasks", {}, success, fial);
    }
}

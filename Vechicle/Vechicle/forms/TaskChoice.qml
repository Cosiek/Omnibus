import QtQuick 2.4
import QtQuick.Controls 2.3

import "../lib/HttpRequest.js" as HttpRequest

TaskChoiceForm {
    id: taskChoiceForm

    property var preferred: null
    property var tasks: []

    function lockForm(){
        console.log("lock")
        submitButton.enabled = false;
        technicalDriveButton.enabled = false;
        brigadeChoiceComboBox.enabled = false;
        lineChoiceComboBox.enabled = false;
    }

    function unlockForm(){
        console.log("unlock")
        submitButton.enabled = true;
        technicalDriveButton.enabled = true;
        brigadeChoiceComboBox.enabled = true;
        lineChoiceComboBox.enabled = true;
    }

    StackView.onActivated: {
        console.log("onActivated")
        lockForm();
        // download tasks =============

        // prepare success callback
        function success(xhr){
            // clear previous answers
            lineChoiceComboBox.model.clear();

            // parse response
            var response = JSON.parse(xhr.responseText);
            // add preffered task to combo boxes
            taskChoiceForm.preferred = response.preferred;
            taskChoiceForm.tasks = response.tasks;
            if (response.preferred !== null){
                var d = response.preferred[0];
                lineChoiceComboBox.model.append({text: d, id: d });
                lineChoiceComboBox.currentIndex = 0;
            }
            // add lines to combobox
            for (var name in response.tasks){
                if (response.preferred !== null && name === response.preferred[0]){
                    continue
                }
                lineChoiceComboBox.model.append({text: name, id: name });
            }
            unlockForm();
        }
        // prepare fial callback
        function fial(xhr){ unlockForm() }

        // send request
        HttpRequest.send("/device/tasks", {}, success, fial);
    }

    function resetBrigadesInput(lineText){
        // clear brigades select
        brigadeChoiceComboBox.model.clear();
        // load preferred brigade...
        if (this.preferred !== null && this.preferred[1] !== null){
            // ...if preferred line was chosen
            if (this.preferred[0] === lineText){
                var d = this.preferred[1];
                brigadeChoiceComboBox.model.append({text: d, id: d});
                brigadeChoiceComboBox.currentIndex = 0;
            }
        }
        // load other brigades
        for (var idx in taskChoiceForm.tasks[lineText]){
            d = taskChoiceForm.tasks[lineText][idx];
            if (d !== lineText){
                brigadeChoiceComboBox.model.append({text: d, id: d});
            }
        }

    }

    lineChoiceComboBox.onCurrentTextChanged: {
        resetBrigadesInput(lineChoiceComboBox.currentText);
    }

    lineChoiceComboBox.contentItem.onActiveFocusChanged: {
        if (!lineChoiceComboBox.focus){
            resetBrigadesInput(lineChoiceComboBox.contentItem.text);
        }
    }

    technicalDriveButton.onClicked: {
        console.log("technicalDriveButton")
        lockForm()

        function success(xhr){
            console.log("technical drive - success")
            stackView.push("Route.qml", {"routeData": response});
        }

        function fial(xhr){
            console.log("technical drive - fial")
            unlockForm()
        }

        HttpRequest.send("/device/technical_drive", {}, success, fial);
    }

    submitButton.onClicked: {
        console.log("submitButton clicked")
        lockForm()

        function success(xhr){
            console.log("submit - success")
            var response = JSON.parse(xhr.responseText)
            stackView.push("Route.qml", {"routeData": response});
        }

        function fial(xhr){
            console.log("task - fial")
            unlockForm()
        }

        data = {
            'line': lineChoiceComboBox.contentItem.text,
            'brigade': brigadeChoiceComboBox.contentItem.text,
        }

        HttpRequest.send("/device/task", data, success, fial)
    }
}

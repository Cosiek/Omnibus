import QtQuick 2.4
import QtQuick.Controls 2.1

LoginForm {
    property var drivers: []
    property var preferredDrivers: []

    StackView.onActivated: {
        loginComboBox.model.clear()
        // add preffered drivers to combo box
        for (var idx in this.preferredDrivers){
            var d = this.preferredDrivers[idx]
            loginComboBox.model.append({text: d, id: d })
        }
        // add other drivers to combo box
        for (idx in this.drivers){
            d = this.drivers[idx]
            if (this.preferredDrivers.indexOf(d) === -1){
                loginComboBox.model.append({text: d, id: d })
            }
        }
    }
}

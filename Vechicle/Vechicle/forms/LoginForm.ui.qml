import QtQuick 2.4
import QtQuick.Controls 2.3

Item {
    id: element
    property alias loginButton: loginButton
    property alias passwordInput: passwordInput
    property alias loginComboBox: loginComboBox
    property alias busyIndicator: busyIndicator
    property alias statusText: statusText

    Column {
        id: column
        anchors.fill: parent
    }

    Text {
        id: header
        x: 165
        width: 105
        height: 20
        text: qsTr("Logowanie")
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 16
    }

    Button {
        id: loginButton
        x: 150
        y: 339
        width: 200
        text: qsTr("zaloguj")
        enabled: false
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 21
    }

    Text {
        id: element1
        y: 45
        text: qsTr("Login")
        anchors.left: loginComboBox.right
        anchors.leftMargin: -199
        anchors.bottom: loginComboBox.top
        anchors.bottomMargin: 6
        enabled: false
        font.pixelSize: 12
    }

    ComboBox {
        id: loginComboBox
        x: 250
        width: 200
        enabled: false
        textRole: "text"
        model: ListModel {}
        editable: true
        anchors.top: header.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: element2
        y: 350
        text: qsTr("Hasło")
        anchors.left: passwordBack.right
        anchors.leftMargin: -200
        anchors.bottom: passwordBack.top
        anchors.bottomMargin: 6
        font.pixelSize: 12
    }

    Rectangle {
        id: passwordBack
        x: 220
        y: 209
        width: 200
        height: 40
        color: "#dcdcdc"
        anchors.bottom: loginButton.top
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter

        TextInput {
            id: passwordInput
            x: 154
            y: 107
            width: 200
            height: 15
            text: ""
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            echoMode: TextInput.Password
            horizontalAlignment: Text.AlignHCenter
        }
    }

    BusyIndicator {
        id: busyIndicator
        x: 284
        width: 100
        height: 100
        anchors.top: loginComboBox.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: statusText
        x: 308
        text: qsTr(" ")
        horizontalAlignment: Text.AlignHCenter
        anchors.top: busyIndicator.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 12
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1;anchors_height:400;anchors_width:200;anchors_x:110;anchors_y:33}
D{i:2;anchors_y:8}D{i:4;anchors_x:221;anchors_y:210}D{i:5;anchors_x:221;anchors_y:64}
D{i:7;anchors_x:220}D{i:9;anchors_height:40;anchors_width:200;anchors_x:154;anchors_y:107}
D{i:8;anchors_y:64}D{i:10;anchors_y:181}D{i:11;anchors_y:241}
}
##^##*/


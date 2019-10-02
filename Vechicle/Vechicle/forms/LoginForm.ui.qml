import QtQuick 2.4
import QtQuick.Controls 2.3

Item {
    id: element
    property alias loginButton: loginButton
    property alias passwordInput: passwordInput
    property alias loginInput: loginInput
    property alias fastLoginButton2: fastLoginButton2
    property alias fastLoginButton1: fastLoginButton1

    Column {
        id: column
        anchors.fill: parent
    }

    TextInput {
        id: textInput
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

    TextField {
        id: loginInput
        x: 100
        text: qsTr("")
        anchors.horizontalCenterOffset: 0
        anchors.top: textInput.bottom
        anchors.topMargin: 36
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TextField {
        id: passwordInput
        x: 100
        y: 281
        text: qsTr("")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: loginButton.top
        anchors.bottomMargin: 18
    }

    Button {
        id: loginButton
        x: 150
        y: 339
        text: qsTr("zaloguj")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 21
    }

    Button {
        id: fastLoginButton1
        x: 150
        width: 200
        height: 40
        text: qsTr("Button")
        anchors.horizontalCenterOffset: 0
        anchors.top: loginInput.bottom
        anchors.topMargin: 35
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: element1
        y: 45
        text: qsTr("Login")
        anchors.left: loginInput.right
        anchors.leftMargin: -199
        anchors.bottom: loginInput.top
        anchors.bottomMargin: 6
        enabled: false
        font.pixelSize: 12
    }

    Text {
        id: element2
        y: 342
        text: qsTr("Hasło")
        anchors.left: passwordInput.right
        anchors.leftMargin: -200
        anchors.bottom: passwordInput.top
        anchors.bottomMargin: 6
        font.pixelSize: 12
    }

    Button {
        id: fastLoginButton2
        x: 155
        width: 200
        height: 40
        text: qsTr("Button")
        anchors.horizontalCenterOffset: 0
        anchors.top: fastLoginButton1.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1;anchors_height:400;anchors_width:200;anchors_x:110;anchors_y:33}
D{i:2;anchors_y:8}D{i:3;anchors_y:110}D{i:6;anchors_y:156}D{i:7;anchors_x:221}D{i:8;anchors_x:220}
D{i:9;anchors_y:210}
}
##^##*/

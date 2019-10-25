import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Item {
    id: element
    RowLayout {
        id: topBar
        height: 25
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0

        Text {
            id: connectionInfoText
            text: qsTr("Ok")
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignRight
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            font.pixelSize: 12
        }

        Text {
            id: timerText
            text: qsTr("00:00")
            Layout.fillWidth: false
            Layout.rightMargin: 10
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            font.pixelSize: 12
        }
    }

    RowLayout {
        id: taskBar
        height: 50
        anchors.right: parent.right
        anchors.rightMargin: -0.433
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: topBar.bottom
        anchors.topMargin: 0

        Text {
            id: taskText
            text: qsTr("? → ?")
            Layout.leftMargin: 10
            font.pixelSize: 21
        }

        Text {
            id: delayText
            text: qsTr("00:00")
            Layout.rightMargin: 11
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            font.pixelSize: 21
        }
    }

    Column {
        id: routeDisplay
        anchors.bottom: messageDisplayRow.top
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: taskBar.bottom
        anchors.topMargin: 0
    }

    RowLayout {
        id: buttonsBar
        height: 50
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0

        Button {
            id: finishButton
            text: qsTr("Koniec")
            Layout.leftMargin: 10
            Layout.fillWidth: true
        }

        Button {
            id: malfunctionButton
            text: qsTr("Awaria")
            Layout.fillWidth: true
        }

        Button {
            id: trafficButton
            text: qsTr("Korek")
            Layout.fillWidth: true
        }

        Button {
            id: logoutButton
            text: qsTr("Wyloguj")
            Layout.rightMargin: 10
            Layout.fillWidth: true
        }
    }

    RowLayout {
        id: messageDisplayRow
        height: 50
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: buttonsBar.top
        anchors.bottomMargin: 0

        Text {
            id: messageDisplay
            text: qsTr("Witaj!")
            Layout.rightMargin: 10
            Layout.leftMargin: 10
            Layout.fillHeight: true
            Layout.fillWidth: true
            font.pixelSize: 12
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1;anchors_x:185;anchors_y:127}D{i:4;anchors_width:100;anchors_x:180;anchors_y:151}
D{i:7;anchors_height:105;anchors_width:200;anchors_x:185;anchors_y:187}D{i:8;anchors_width:100;anchors_x:263}
D{i:13;anchors_width:100;anchors_x:180}
}
##^##*/


import QtQuick 2.4
import QtQuick.Controls 2.3

Item {
    id: element2
    property alias submitButton: submitButton
    property alias technicalDriveButton: technicalDriveButton
    property alias brigadeChoiceComboBox: brigadeChoiceComboBox
    property alias lineChoiceComboBox: lineChoiceComboBox

    Text {
        id: element
        y: 43
        text: qsTr("Linia")
        anchors.left: lineChoiceComboBox.right
        anchors.leftMargin: -140
        anchors.bottom: lineChoiceComboBox.top
        anchors.bottomMargin: 6
        font.pixelSize: 12
    }

    Button {
        id: submitButton
        x: 151
        y: 235
        text: qsTr("Zatwierdź")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: technicalDriveButton.bottom
        anchors.topMargin: 15
    }

    Button {
        id: technicalDriveButton
        x: 126
        y: 180
        text: qsTr("Przejazd techniczny")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: brigadeChoiceComboBox.bottom
        anchors.topMargin: 15
    }

    ComboBox {
        id: brigadeChoiceComboBox
        x: 130
        y: 125
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: lineChoiceComboBox.bottom
        anchors.topMargin: 23
        editable: true
        textRole: "text"
        model: ListModel {}
    }

    ComboBox {
        id: lineChoiceComboBox
        x: 130
        y: 62
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: header.bottom
        anchors.topMargin: 23
        editable: true
        textRole: "text"
        model: ListModel {}
    }

    Text {
        id: header
        x: 147
        y: 8
        width: 105
        height: 20
        text: qsTr("Wybór linii")
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 16
        anchors.topMargin: 8
        anchors.top: parent.top
    }

    Text {
        id: element1
        y: 108
        text: qsTr("Brygada")
        anchors.bottom: brigadeChoiceComboBox.top
        anchors.bottomMargin: 4
        anchors.left: brigadeChoiceComboBox.right
        anchors.leftMargin: -139
        font.pixelSize: 12
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1;anchors_x:130;anchors_y:62}D{i:2;anchors_y:241}
D{i:3;anchors_x:188;anchors_y:241}D{i:4;anchors_y:171}D{i:6;anchors_y:171}D{i:8;anchors_y:8}
D{i:9;anchors_x:131}
}
##^##*/


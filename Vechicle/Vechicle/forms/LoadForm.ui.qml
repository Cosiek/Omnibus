import QtQuick 2.4
import QtQuick.Controls 2.3

Item {
    id: element
    property alias loadFormText: loadFormText
    property alias loadFormBusyIndicator: loadFormBusyIndicator

    BusyIndicator {
        id: loadFormBusyIndicator
        x: 290
        y: 210
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: loadFormText
        x: 298
        y: 0
        text: qsTr("Loading")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: loadFormBusyIndicator.bottom
        anchors.topMargin: 0
        font.pixelSize: 12
    }


}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

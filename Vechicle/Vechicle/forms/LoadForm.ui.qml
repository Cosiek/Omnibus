import QtQuick 2.4
import QtQuick.Controls 2.3

Item {
    id: element
    width: 400
    height: 400

    BusyIndicator {
        id: busyIndicator
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
}

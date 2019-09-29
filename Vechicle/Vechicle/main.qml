import QtQuick 2.10
import QtQuick.Controls 2.3

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Stack")

    StackView {
        id: stackView
        initialItem: "forms/Load.qml"
        anchors.fill: parent
    }
}

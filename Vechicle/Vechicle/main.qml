import QtQuick 2.10
import QtQuick.Controls 2.3

ApplicationWindow {
    id: window
    visible: true
    width: 300
    height: 350
    minimumHeight: 350
    minimumWidth: 300
    title: qsTr("Omnibus - Vechicle")

    StackView {
        id: stackView
        initialItem: "forms/Load.qml"
        anchors.fill: parent
    }
}

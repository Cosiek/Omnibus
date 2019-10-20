import QtQuick 2.4
import QtQuick.Controls 2.3

RouteForm {
    property var routeData: ({})

    StackView.onActivated: {
        console.log("Route activated")
        console.log(routeData.schedule)
    }
}

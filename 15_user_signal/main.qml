import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width       : 640
    height      : 480
    visible     : true
    title       : qsTr("Hello World")

    Rectangle {
        id          : rect
        anchors.fill: parent
        color       : "red"

        signal      activated(real x, real y)
        signal      deactivated

        MouseArea {
            anchors.fill    : parent
            onPressed       : rect.activated(mouseX, mouseY)
            onReleased      : rect.deactivated()
        }

        onActivated: console.log("Activated", x, y)
        onDeactivated: console.log("Deactivated")
    }
}

import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width       : 640
    height      : 480
    visible     : true
    title       : qsTr("Hello World")

    DropArea {
        x       : 75
        y       : 75
        width   : 50
        height  : 50

        Rectangle {
            anchors.fill    : parent
            color           : "green"
            visible         : parent.containsDrag
        }
    }

    Rectangle {
        x       : 10
        y       : 10
        width   : 20
        height  : 20
        color   : "red"

        Drag.active : dragArea.drag.active
        Drag.hotSpot : (10, 10)

        MouseArea {
            id              : dragArea
            anchors.fill    : parent
            drag.target     : parent
        }
    }
}

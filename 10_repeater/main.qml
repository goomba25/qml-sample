import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width           : 400
    height          : 100
    visible         : true
    title           : qsTr("Hello World")

    Row {
        anchors.top     : parent.top

        Repeater {
            model           : 3

            Rectangle {
                width           : 100
                height          : 30
                border.width    : 2
                color           : "lightyellow"
            }
        }
    }

    Column {
        anchors.right: parent.right

        Repeater {
            model           : 3

            Rectangle {
                width           : 50
                height          : 20
                border.width    : 3
                color           : "lightblue"
            }
        }
    }
}

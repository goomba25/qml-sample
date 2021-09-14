import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id              : root
    width           : 400
    height          : 800
    visible         : true
    title           : qsTr("Hello World")

    Rectangle {
        id                  : rect1
        anchors.centerIn    : parent
        width               : 300
        height              : 150
        color               : "lightblue"

        Rectangle {
            id : rect1_1
            anchors.centerIn: parent
            width: rect1.width / 2
            height: rect1.height / 2
            color: "yellow"
        }
    }

    Rectangle {
        id          : rect2
        x           : 50
        y           : 50
        width       : 300
        height      : 150
        color       : "green"

        Rectangle {
            id                      : rect2_1
            x : parent.width / 2
            width       : 50
            height      : 50
            color       : "white"

            anchors.verticalCenter  : parent.verticalCenter
//            x           : 50
//            y           : 50
        }
    }

    Rectangle {
        id          : rect3
        x           : 50
        y           : 600
        width       : 300
        height      : 150
        color       : "black"

        Rectangle {
            id          : rect3_1
            x           : 100
            y           : 50
            width       : 150
            height      : 50
            color       : "red"
        }
    }
}

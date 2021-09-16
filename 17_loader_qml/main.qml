import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id          : root
    width       : 640
    height      : 480
    visible     : true
    title       : qsTr("Hello World")

    Loader {
        id          : pageLoader
        anchors.top : rect.bottom
        width: rect.width
        height: rect.height
    }

    Rectangle {
        id              :rect
        anchors.right   : parent.right
        anchors.top     : parent.top
        anchors.left    : parent.left
        height          : 240
        color           : "lightyellow"

        Text {
            text                : qsTr("Main")
            anchors.centerIn    : parent
            font.weight         : Font.ExtraBold
            font.pixelSize      : 36
        }

        MouseArea {
            anchors.fill        : parent
            onClicked           : {
                pageLoader.source = "subqml.qml"
            }
        }
    }
}

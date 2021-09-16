import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width   : 640
    height  : 480
    visible : true
    title   : qsTr("Hello World")

    Flickable {
        anchors.fill    : parent
        contentWidth    : rect.width
        contentHeight   : rect.height
        interactive: true

        Rectangle {
            id      : rect
            width   : 200
            height  : 150

            color   : mouseArea.containsMouse ? "green" : "red"

            MouseArea {
                id              : mouseArea
                anchors.fill    : parent
                hoverEnabled    : true
            }
        }
    }
}

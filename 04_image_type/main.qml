import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 200
    height: 200
    visible: true

    color: "lightblue"

    Rectangle {
        anchors.centerIn: parent
        width: 150
        height: 150
        color: "white"

        Image {
            anchors.centerIn: parent
            width: parent.width - 50
            height: parent.height - 50
            source: "/image/qtlogo.png"
        }
    }
}

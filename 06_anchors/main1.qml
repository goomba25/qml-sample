import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 300
    height: 300
    visible: true
    title: qsTr("Sample 1")

    Rectangle {
        id : rect1
        width: 300
        height: 300
        color: "lightblue"

        Rectangle {
            id : subrect
            width: 300
            height: 100
            color: "yellow"
        }

        Text {
            id: rect1_text
            text: qsTr("text")
            color: "Green"
            font.pixelSize: 32
            anchors.top: subrect.bottom
            anchors.horizontalCenter: parent.horizontalCenter
//            anchors.centerIn: rect1
        }
    }
}

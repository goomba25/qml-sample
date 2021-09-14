import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: Screen.width / 2
    height: Screen.height / 2
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        width: 300
        height: 200
        color: "lightblue"

        anchors.centerIn: parent
    }
}

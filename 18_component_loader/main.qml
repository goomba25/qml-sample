import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width       : 640
    height      : 480
    visible     : true
    title       : qsTr("Hello World")

    Loader {
        anchors.centerIn    : parent
        sourceComponent     : rect
    }

    Component {
        id  : rect

        Rectangle {
            width       : 50
            height      : 50
            color       : "red"
        }
    }
}

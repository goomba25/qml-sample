import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Loader {
        id      : sub
        source  : "subqml.qml"
    }

    Connections {
        target      : sub.item
        onMessage   : console.log(text)
    }
}

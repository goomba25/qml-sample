import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id          : root
    width       : 200
    height      : 200
    visible     : true
    title       : qsTr("Hello World")
    color       : "orange"

    Text {
        x                       : 20
        y                       : 100
        text                    : "Hello World with QML"
        horizontalAlignment     : Text.AlignHCenter
    }
}

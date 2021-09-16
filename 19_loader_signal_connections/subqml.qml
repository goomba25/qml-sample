import QtQuick 2.0

Rectangle {
    id              : rect
    color           : "red"
    width           : 100
    height          : 100

    signal message(string text)

    Text {
        text            : "text"
        color           : "white"
        font.weight     : Font.DemiBold
        font.pixelSize  : 32
        anchors.centerIn: parent
    }

    MouseArea {
        anchors.fill: parent
        onClicked: rect.message("clicked")
    }
}

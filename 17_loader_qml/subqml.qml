import QtQuick 2.0

Item {
    Rectangle {
        id              : rect
        anchors.fill    : parent
        color           : "red"

        Text {
            text            : qsTr("Sub")
            color           : "white"
            font.weight     : Font.DemiBold
            font.pixelSize  : 32
            anchors.centerIn: parent
        }
    }
}

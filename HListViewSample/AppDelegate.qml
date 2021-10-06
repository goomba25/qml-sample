import QtQuick 2.11

Item {
    property string itemText    : ""
    property string itemColor   : ""
    property int    itemRadius  : 20
    property string textColor
    property int    textSize    : 32

    Rectangle {
        id              : idRect_AppShape
        anchors.fill    : parent
        color           : itemColor
        radius          : itemRadius
        border.width    : 2
        border.color    : "#FFFFFF"

        Text {
            id                  : idText_AppName
            text                : itemText
            color               : textColor
            font.pixelSize      : textSize
            font.weight         : Font.DemiBold
            anchors.centerIn    : parent
        }
    }
}

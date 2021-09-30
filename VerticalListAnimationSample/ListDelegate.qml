import QtQuick 2.11

Item {
    property string itemText    : ""
    property string itemColor   : ""
    property int    itemRadius  : 10
    property string textColor

    Rectangle {
        id              : idRect_Item
        anchors.fill    : parent
        anchors.centerIn: parent
        color           : itemColor
        radius          : itemRadius
        border.width    : 2
        border.color    : "#FFFFFF"

        Text {
            id                  : idText_Item
            text                : itemText
            color               : textColor
            font.pixelSize      : 24
            font.weight         : Font.DemiBold
            anchors.centerIn    : parent
        }
    }
}

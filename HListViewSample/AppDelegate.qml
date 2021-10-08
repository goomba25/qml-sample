import QtQuick 2.11
import QtGraphicalEffects 1.0

Item {
    property string itemText    : ""
    property string itemColor   : ""
    property int    itemRadius  : 20
    property string textColor   : ""
    property int    textSize    : 32
    property string imageSource : ""

    Rectangle {
        id              : idRect_App
        anchors.fill    : parent
        color           : itemColor
        radius          : itemRadius
        border.width    : 2
        border.color    : "#FFFFFF"
        clip            : true

        Image {
            id              : idImage_App
            anchors.fill    : parent
            source          : imageSource
            fillMode        : Image.PreserveAspectCrop
            layer.enabled   : true
            layer.effect    : OpacityMask {
                maskSource: parent
            }
        }
    }
}

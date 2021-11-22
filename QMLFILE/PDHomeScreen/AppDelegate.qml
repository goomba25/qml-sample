import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    property string itemText
    property string itemColor
    property int    itemRadius  : 20
    property string imageSource

    Rectangle {
        id              : idRect
        anchors.fill    : parent
        color           : itemColor
        radius          : itemRadius

        Image {
            id              : idImage
            anchors.fill    : parent
            source          : imageSource
            fillMode        : Image.PreserveAspectCrop
            layer.enabled   : true
            layer.effect    : OpacityMask { maskSource: parent }
        }
    }

    Rectangle {
        anchors.fill    : parent
        color           : "#FFFFFF"
        radius          : itemRadius
        opacity         : 0.5
    }
}

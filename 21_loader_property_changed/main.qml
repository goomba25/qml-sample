import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width       : 200
    height      : 200
    visible     : true
    title       : qsTr("Hello World")

    Loader {
        id          : loader
        onLoaded    : {
            console.log("width :" + loader.item.width)
        }
    }

    Component.onCompleted: {
        loader.setSource("sub.qml", {color : "blue"})
    }

    Rectangle {
        anchors.top     : loader.bottom
        width           : 200
        height          : 100
        color           : "green"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                loader.setSource("sub.qml", {"width" : 200})
            }
        }
    }
}

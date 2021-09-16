import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width       : 640
    height      : 480
    visible     : true
    title       : qsTr("Hello World")

    Rectangle {
        id          : rect
        width       : parent.width
        height      : 240
        color       : "yellow"

        Text {
            text                : "Main"
            anchors.centerIn    : parent
            font.pixelSize      : 32
        }

        MouseArea {
            anchors.fill: parent
            onClicked: loader.source = "sub.qml"
        }
    }

    Loader {
        id          : loader
        anchors.top : rect.bottom
        width       : rect.width
        height      : rect.height


        onStatusChanged: {
            if ( loader.status == Loader.Null ) {
                console.log("Null")
            } else if( loader.status == Loader.Ready ) {
                console.log("Ready")
            } else if( loader.status == Loader.Loading ) {
                console.log("Loading")
            } else {
                console.log("Error")
            }
        }
    }
}

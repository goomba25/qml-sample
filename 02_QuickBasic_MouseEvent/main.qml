import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id          : root
    width       : 512
    height      : 320
    visible     : true
    color       : "#D8D8D8"

    property int rotationStep       : 45

    Image {
        id                          : pole
        source                      : "stick.png"
        anchors.horizontalCenter    : parent.horizontalCenter
        anchors.bottom              : parent.bottom
    }

    Image {
        id                          : wheel
        source                      : "wheel.png"
        anchors.centerIn            : parent
        Behavior on rotation {
            NumberAnimation {
                duration : 250
            }
        }
    }

    MouseArea {
        anchors.fill    : parent

        onPressed       : wheel.rotation += 90
    }

    Item {
        anchors.fill        : parent
        focus               : true
        Keys.onLeftPressed  : {
            console.log("move left")
            wheel.rotation -= root.rotationStep
        }

        Keys.onRightPressed : {
            console.log("move right")
            wheel.rotation += root.rotationStep
        }
    }
}

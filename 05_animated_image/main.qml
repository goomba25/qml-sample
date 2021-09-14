import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: animation.width
    height: animation.height + 10
    visible: true
    title: qsTr("Hello World")

    AnimatedImage {
        id : animation
        source: "/image/ani.gif"
    }

    Rectangle {
        property int frames: animation.frameCount
        width: 4
        height: 8
        x: (animation.width - width) * animation.currentFrame / frames
        y: animation.height + 1
        color: "red"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            if (animation.paused == true) {
                animation.paused = false
            } else {
                animation.paused = true
            }
        }
    }
}

import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width   : 640
    height  : 480
    visible : true

    Rectangle {
        anchors.fill    : parent
        color           : "red"

        Text {
            id                  : myText
            anchors.centerIn    : parent
            text                : msg.author

            Component.onCompleted: {
                msg.author = "Hello"
                myText.text = msg.author
            }
        }
    }

    MouseArea {
        anchors.fill    : parent

        onClicked: {
            var str = "Who are you?"
            var result = msg.postMessage(str)
            console.log("Result of postMessage():", result)
            msg.refresh()
        }
    }
}

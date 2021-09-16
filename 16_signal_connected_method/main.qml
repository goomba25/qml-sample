import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id          : root
    width       : 640
    height      : 480
    visible     : true
    title       : qsTr("Hello World")
    property int num: 0

    signal messageReceived(string text)

    Component.onCompleted: {
        root.messageReceived.connect(sendToPost)
        root.messageReceived.connect(sendToTelegraph)
        root.messageReceived.connect(sendToEmail)
    }

    function sendToPost(text) {
        console.log("[Send Post]", text)
    }

    function sendToTelegraph(text) {
        console.log("[Send Telegraph]", text)
    }

    function sendToEmail(text) {
        console.log("[Send Email]", text)
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.messageReceived("message"+num)
            num++
        }
    }
}

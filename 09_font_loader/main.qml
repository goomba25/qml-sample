import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {

        anchors.centerIn: parent

        FontLoader {
            id : fixedFont
            name: "Courier"
        }

        FontLoader {
            id: webfont
            source: "http://www.mysite.com/myfont.ttf"
        }

        Text {
            text: qsTr("Fixed-size font")
            font.family: fixedFont.name
            anchors.centerIn: parent
        }
    }
}

import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Item {
        id          : item
        width       : 640
        height      : 480

        Loader {
            id              : loader
            anchors.top     : item.top
            anchors.left    : item.left
            anchors.right   : item.right
            anchors.bottom  : button1.top

            onLoaded: { source: "sub1.qml" }
        }

        Rectangle {
            id              : button1
            anchors.left    : item.left
            anchors.bottom  : item.bottom
            width           : item.width / 2
            color           : "gray"
            height          : 100

            Text {
                anchors.centerIn    : parent
                text                : qsTr("Button1")
                color               : "white"
                font.weight         : Font.DemiBold
            }

            MouseArea {
                anchors.fill: parent
                onClicked: item.state = "sub1"
            }
        }

        Rectangle {
            id              : button2
            anchors.right   : item.right
            anchors.bottom  : item.bottom
            width           : item.width / 2
            color           : "gray"
            height          : 100

            Text {
                anchors.centerIn    : parent
                text                : qsTr("Button2")
                color               : "white"
                font.weight         : Font.DemiBold
            }

            MouseArea {
                anchors.fill: parent
                onClicked: item.state = "sub2"
            }
        }

        state: "sub1"

        states: [
            State {
                name: "sub1"
                PropertyChanges {
                    target  : button1
                    color   : "green"
                }

                PropertyChanges {
                    target  : loader
                    source  : "sub1.qml"
                }
            },

            State {
                name: "sub2"
                PropertyChanges {
                    target  : button2
                    color   : "green"
                }

                PropertyChanges {
                    target  : loader
                    source  : "sub2.qml"
                }
            }
        ]
    }
}

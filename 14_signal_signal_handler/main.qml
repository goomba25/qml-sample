import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width   : 640
    height  : 480
    visible : true
    title   : qsTr("Hello World")

    Row {
        x       : 10
        y       : 10
        spacing : 20

        Rectangle {
            width       : 100
            height      : 100
            color       : "skyblue"

            MouseArea {
                anchors.fill    : parent
                onClicked       : {
                    parent.color = "green"
                    console.log("Clicked", mouse.x, mouse.y)
                }
            }
        }

        Rectangle {
            id          : rect1
            width       : 100
            height      : 100
            color       : "skyblue"

            MouseArea {
                id              : mouseArea
                anchors.fill    : parent
            }

            Connections {
                target      : mouseArea
                onClicked   : {
                    rect1.color = "yellow"
                    console.log("Clicked", mouse.x, mouse.y)
                }
            }
        }

        Rectangle {
            id          : rect2
            width       : 100
            height      : 100
            color       : "skyblue"

            MouseArea {
                anchors.fill    : parent
                onPressed       : rect2.color = "red"
                onReleased      : rect2.color = "skyblue"
            }
        }
    }
}

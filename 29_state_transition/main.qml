import QtQuick 2.12
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.2

ApplicationWindow {
    width       : 300
    height      : 400
    visible     : true

    Rectangle {
        anchors.fill: parent

        Rectangle {
            id          : onElement
            x           : 100
            y           : 50
            width       : 100
            height      : 100
        }

        Rectangle {
            id          : offElement
            x           : 100
            y           : 250
            width       : 100
            height      : 100
        }

        state: "on"

        MouseArea {
            anchors.fill: parent
            onClicked: parent.state == "on" ? parent.state = "off" : parent.state = "on"
        }

        states: [
            State {
                name: "on"
                PropertyChanges {
                    target  : onElement
                    color   : "red"
                }

                PropertyChanges {
                    target  : offElement
                    color   : "blue"
                }
            },

            State {
                name: "off"
                PropertyChanges {
                    target  : onElement
                    color   : "blue"
                }

                PropertyChanges {
                    target  : offElement
                    color   : "red"
                }
            }

        ]

        transitions: [
            Transition {
                from    : "on"
                to      : "off"
                PropertyAnimation {
                    target: onElement
                    properties: "color"
                    duration: 1500
                }

                PropertyAnimation {
                    target: offElement
                    properties: "color"
                    duration: 1500
                }
            },

            Transition {
                from    : "off"
                to      : "on"
                PropertyAnimation {
                    target: offElement
                    properties: "color"
                    duration: 1500
                }

                PropertyAnimation {
                    target: onElement
                    properties: "color"
                    duration: 1500
                }
            }
        ]
    }
}

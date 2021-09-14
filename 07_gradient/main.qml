import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id              : root
    width           : 640
    height          : 480
    visible         : true
    title           : qsTr("Hello World")

    Rectangle {
        width           : Window.width
        height          : root.height

        gradient: Gradient {
            GradientStop {
                position    : 0.0
                color       : "red"
            }

            GradientStop {
                position    : 0.7
                color       : "yellow"
            }

            GradientStop {
                position    : 1.0
                color       : "green"
            }
        }
    }
}

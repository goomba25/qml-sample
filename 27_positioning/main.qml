import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.0

Window {
    width       : 200
    height      : 200
    visible     : true

    Grid {

        Repeater {
            model: 16

            Rectangle {
                id              : rect
                border.width    : 1
                width           : 50
                height          : 50

                color :  Positioner.isFirstItem ? "yellow" : "skyblue"

                Text {
                    x       : 5
                    y       : 5
                    text    : rect.Positioner.index
                }
            }
        }
    }
}

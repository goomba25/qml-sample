import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width       : 550
    height      : 220
    visible     : true
    title       : qsTr("Hello World")

    Row {
        x           : 10
        y           : 10
        spacing     : 10

        Image {
            id      : img_1
            source  : "qtlogo.png"
        }

        Image {
            id          : img_2
            source      : img_1.source
            transform   : Rotation {
                origin.x : 30
                origin.y : 30
                axis        {x : 0;y : 1;z : 0}
                angle       : 50
            }
        }

        Image {
            id          : img_3
            source      : img_2.source
            transform   : Rotation {
                origin.x : -130
                origin.y : 50
                axis        {x : 0;y : 1;z : 0}
                angle       : 70
            }
        }
    }
}

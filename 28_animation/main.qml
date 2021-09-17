import QtQuick 2.12
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.2

ApplicationWindow {
    width       : 400
    height      : 300
    visible     : true
    title       : qsTr("Hello World")


    Rectangle {
        x           : 10
        y           : 10
        width       : 90
        height      : 90

        QImg {}

        NumberAnimation on x {
            from        : 10
            to          : 300
            duration    : 1000
        }
    }

    Rectangle {
        id          : rect
        x           : 110
        y           : 90
        width       : 90
        height      : 90

        QImg {}
    }

    PropertyAnimation {
        target      : rect
        properties  : "width"
        from        : 10
        to          : 90
        duration    : 1000
        running     : true
    }

    Rectangle {
        x           : 150
        y           : 190
        width       : 90
        height      : 90

        QImg {}

        RotationAnimation on rotation {
            from        : 0
            to          : 90
            direction   : RotationAnimation.Shortest
            duration    : 1000
        }
    }
}

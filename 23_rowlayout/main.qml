import QtQuick 2.12
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    width       : 400
    height      : 300
    visible     : true

    RowLayout {
        id              : rowLayout
        anchors.fill    : parent
        spacing         : 10

        Rectangle {
            color                   : "blue"
            Layout.fillWidth        : true
            Layout.minimumWidth     : 50
            Layout.preferredWidth   : 100
            Layout.maximumWidth     : 300
            Layout.minimumHeight    : 40

            Text {
                anchors.centerIn    : parent
                color               : "white"
                text                : parent.width + 'x' + parent.height
            }
        }

        Rectangle {
            color                   : "green"
            Layout.fillWidth        : true
            Layout.minimumWidth     : 100
            Layout.preferredWidth   : 200
            Layout.preferredHeight  : 100

            Text {
                anchors.centerIn    : parent
                color               : "white"
                text                : parent.width + 'x' + parent.height
            }
        }
    }
}

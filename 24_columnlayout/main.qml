import QtQuick 2.12
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    width       : 400
    height      : 300
    visible     : true

    ColumnLayout {
        id              : columnLayout
        anchors.fill    : parent
        spacing         : 10

        Rectangle {
            color                   : "blue"
            Layout.alignment        : Qt.AlignRight
            Layout.preferredWidth   : 50
            Layout.preferredHeight  : 50

            Text {
                anchors.centerIn    : parent
                color               : "white"
                text                : parent.width + 'x' + parent.height
            }
        }

        Rectangle {
            color                   : "green"
            Layout.alignment        : Qt.AlignCenter
            Layout.fillHeight       : true
            Layout.preferredWidth   : 50
            Layout.preferredHeight  : 50

            Text {
                anchors.centerIn    : parent
                color               : "white"
                text                : parent.width + 'x' + parent.height
            }
        }

        Rectangle {
            color                   : "red"
            Layout.alignment        : Qt.AlignLeft
            Layout.preferredWidth   : 50
            Layout.preferredHeight  : 50

            Text {
                anchors.centerIn    : parent
                color               : "white"
                text                : parent.width + 'x' + parent.height
            }
        }
    }
}

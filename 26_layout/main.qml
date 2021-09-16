import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.0

ApplicationWindow {
    width   : 640
    height  : 480
    visible : true

    property int    margin  : 10

    minimumWidth            : mainLayout.Layout.minimumWidth + 2 * margin
    minimumHeight           : mainLayout.Layout.minimumHeight + 2 * margin

    ColumnLayout {
        id              : mainLayout
        anchors.fill    : parent
        anchors.margins : margin

        GroupBox {
            title               : "Row"
            Layout.fillWidth    : true

            RowLayout {
                anchors.fill: parent

                TextField   { Layout.fillWidth: true }
                Button      { text: "Button1" }
            }
        }

        GroupBox {
            title               : "Grid"
            Layout.fillWidth    : true

            GridLayout {
                anchors.fill    : parent
                rows            : 3
                flow            : GridLayout.TopToBottom

                Label { text: "Line 1" }
                Label { text: "Line 2" }
                Label { text: "Line 3" }

                TextField { }
                TextField { }
                TextField { }

                TextField {
                    Layout.rowSpan      : 3
                    Layout.fillWidth    : true
                    Layout.fillHeight   : true
                }
            }
        }

        TextField {
            Layout.fillWidth        : true
            Layout.fillHeight       : true
            Layout.minimumHeight    : 30
        }
    }
}

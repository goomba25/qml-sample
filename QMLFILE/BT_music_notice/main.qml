import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.2

Window {
    width   : 1407
    height  : 778
    visible : true

    Rectangle {
        anchors.fill: parent
        color: "#141719"
    }

    ColumnLayout {
        id                  : columnLayout
        anchors.fill        : parent
        anchors.topMargin   : 90
        anchors.leftMargin  : 102
        anchors.rightMargin : 101
        anchors.bottomMargin: 170


        Image {
            id      : infoImage
            source  : "qrc:/image/info.png"
            Layout.alignment: Qt.AlignHCenter
        }




        Rectangle {
            id                  : textbox1
            Layout.topMargin    : 30
            Layout.fillWidth    : true
            height              : 86
            color               : "transparent"

            Text {
                id                  : text1
                text                : "There are currently no playable media.\n"
                font.pixelSize      : 32
                font.family         : "Noto Sans"
                font.weight         : Font.DemiBold
                color               : "#FFFFFF"
                anchors.centerIn    : parent
            }
        }

        Rectangle {
            id                  : textbox2
            Layout.topMargin    : 30
            Layout.fillWidth    : true
            height              : 97
            color               : "transparent"

            Text {
                id                  : text2
                text                : "Please select media from your phone.\nIf you want to change the connection, please press the [Select another device]."
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize      : 30
                font.family         : "Noto Sans"
                color               : "#FFFFFF"
                anchors.centerIn    : parent

            }
        }

        Button {
            id                  : button
            Layout.topMargin    : 150
            Layout.alignment    : Qt.AlignHCenter
            implicitWidth       : 500
            implicitHeight      : 65

            Text {
                text                : "Select another device"
                font.pixelSize      : 32
                font.family         : "Noto Sans"
                font.weight         : Font.DemiBold
                anchors.centerIn    : parent
                color               : "#FFFFFF"
            }

            background:
                Rectangle {
                anchors.fill    : parent
                color           : "#2EE8D6"
                radius          : 10
            }
        }
    }
}

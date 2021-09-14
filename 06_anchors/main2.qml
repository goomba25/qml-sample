import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 400
    height: 200
    visible: true
    title: qsTr("Sample 2")

    Rectangle {
        width       : 400
        height      : 200

        Image {
            source: "/image/bluebackground.png"
        }

        BorderImage {
            source                      : "/image/bluebutton.png"
            width                       : 350
            height                      : 75
            border.left                 : 15
            border.top                  : 15
            border.right                : 15
            border.bottom               : 15
            anchors.horizontalCenter    : parent.horizontalCenter
            anchors.top                 : parent.top
            anchors.topMargin           : 15

            Image {
                source                      : "/image/login.png"
                anchors.left                : parent.left
                anchors.leftMargin          : 40
                anchors.verticalCenter      : parent.verticalCenter
            }

            Text {
                anchors.left                : parent.horizontalCenter
                anchors.leftMargin          : -20
                anchors.verticalCenter      : parent.verticalCenter
                text                        : qsTr("Login")
                font.bold                   : true
                color                       : "white"
                font.pixelSize              : 32
            }
        }

        BorderImage {
            source                      : "/image/bluebutton.png"
            width                       : 350
            height                      : 75
            border.left                 : 15
            border.top                  : 15
            border.right                : 15
            border.bottom               : 15
            anchors.horizontalCenter    : parent.horizontalCenter
            anchors.bottom              : parent.bottom
            anchors.bottomMargin        : 15

            Image {
                source                      : "/image/signout.png"
                anchors.left                : parent.left
                anchors.leftMargin          : 40
                anchors.verticalCenter      : parent.verticalCenter
            }

            Text {
                anchors.left                : parent.horizontalCenter
                anchors.leftMargin          : -20
                anchors.verticalCenter      : parent.verticalCenter
                text                        : qsTr("Sign Out")
                font.bold                   : true
                color                       : "white"
                font.pixelSize              : 32
            }
        }

    }
}

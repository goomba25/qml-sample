import QtQuick 2.11
import QtQuick.Layouts 1.2
import QtGraphicalEffects 1.0

Item {
    property int appSpacing : 30
    property int appWidth   : 250
    property int appHeight  : 500
    property int margine    : 50

    id              : root
    anchors.fill    : parent

    RowLayout {
        anchors.fill: parent

        ColumnLayout {
            id                  : indicatorLayout
            Layout.leftMargin   : 50
            Layout.topMargin    : 54
            Layout.bottomMargin : 66
            Layout.maximumWidth : 240

            Rectangle {
                id                  : hello
                Layout.fillWidth    : true
                height              : 60
                color               : "transparent"

                Text {
                    id                  : helloText
                    text                : "Hello!"
                    horizontalAlignment : Text.AlignLeft
                    verticalAlignment   : Text.AlignVCenter
                    color               : "#FFFFFF"
                    font.pixelSize      : 45
                    font.weight         : Font.DemiBold
                    font.family         : "Noto Sans"
                }
            }

            Rectangle {
                id                  : date
                Layout.topMargin    : 56
                Layout.fillWidth    : true
                height              : 30
                color               : "transparent"

                Text {
                    id                  : dateText
                    text                : "September 18, 2021"
                    horizontalAlignment : Text.AlignLeft
                    verticalAlignment   : Text.AlignVCenter
                    color               : "#FFFFFF"
                    font.pixelSize      : 22
                    font.family         : "Noto Sans"
                }
            }

            Rectangle {
                id                  : day
                Layout.topMargin    : 10
                Layout.fillWidth    : true
                height              : 30
                color               : "transparent"

                Text {
                    id                  : dayText
                    text                : "Wednesday"
                    horizontalAlignment : Text.AlignLeft
                    verticalAlignment   : Text.AlignVCenter
                    color               : "#FFFFFF"
                    font.pixelSize      : 22
                    font.family         : "Noto Sans"
                }
            }

            Item {
                width               : indicatorLayout.width
                Layout.fillHeight   : true
            }

            RowLayout {
                Layout.fillWidth: true
                height          : 56

                Rectangle {
                    id                  : temperature
                    Layout.topMargin    : 21
                    Layout.bottomMargin : 5
                    width               : 30
                    height              : 30
                    color               : "transparent"

                    Text {
                        id                  : temperatureText
                        text                : "15"
                        horizontalAlignment : Text.AlignLeft
                        verticalAlignment   : Text.AlignVCenter
                        color               : "#FFFFFF"
                        font.pixelSize      : 22
                        font.family         : "Noto Sans"
                    }
                }

                Rectangle {
                    id                  : temperatureIcon
                    Layout.topMargin    : 21
                    Layout.bottomMargin : 5
                    width               : 24
                    height              : 30
                    color               : "transparent"

                    Text {
                        id                  : temperatureIconText
                        text                : "℃"
                        horizontalAlignment : Text.AlignLeft
                        verticalAlignment   : Text.AlignVCenter
                        color               : "#FFFFFF"
                        font.pixelSize      : 22
                        font.family         : "Noto Sans"
                    }
                }

                Rectangle {
                    id                  : weatherIcon
                    Layout.leftMargin   : 20
                    width               : 56
                    height              : 56
                    color               : "transparent"
                    border.width        : 2
                    border.color        : "white"
                }
            }

            Rectangle {
                id                  : locale
                Layout.topMargin    : 10
                Layout.fillWidth    : true
                height              : 30
                color               : "transparent"

                Text {
                    id                  : localeText
                    text                : "Irvine, CA"
                    horizontalAlignment : Text.AlignLeft
                    verticalAlignment   : Text.AlignVCenter
                    color               : "#FFFFFF"
                    font.pixelSize      : 22
                    font.family         : "Noto Sans"
                }
            }
        }

        AppList {
            id  : appList
        }

        ListView {
            property int topMarginSize : 54

            id                  : appLauncher
            Layout.topMargin    : topMarginSize
            Layout.leftMargin   : 20
            Layout.bottomMargin : 46
            Layout.fillWidth    : true
            Layout.fillHeight   : true
            orientation         : ListView.Horizontal
            boundsMovement      : ListView.StopAtBounds
            clip                : true
            spacing             : 40
            model               : appList

            delegate: AppDelegate {
                id              : appDelegate
                width           : appWidth
                height          : appHeight
                itemColor       : model.color
                imageSource     : model.image

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        appLauncher.currentIndex = index

                        if (appLauncher.currentIndex === (appLauncher.count - 1)) {
//                            appLauncher.insert(
//                                        (appLauncher.count - 1),
//                                        { "name" : "a" + (appLauncher.count - 1),
//                                            "color" : "gray", "tColor" : "#FFFFFF" })
                        } else {
                            ghost.x = appLauncher.currentItem.x - appLauncher.contentX + 310
                            ghost.visible = true
                            appDelegate.visible = false
                        }
                    }
                }
            }

            onOpacityChanged: {
                if (appLauncher.opacity == 0) {
                    appLauncher.visible = false
                }
            }
        }
    }

    RowLayout {
        id              : ghostLayout
        anchors.fill    : parent

        Rectangle {
            id          : ghost
            y           : appLauncher.currentItem.y + appLauncher.topMarginSize
            width       : appWidth
            height      : appHeight
            radius      : 20
            color       : appLauncher.currentItem.itemColor
            visible     : false

            Image {
                id              : ghostImage
                source          : appLauncher.currentItem.imageSource
                anchors.fill    : parent
                fillMode        : Image.PreserveAspectCrop
                layer.enabled   : true
                layer.effect    : OpacityMask { maskSource: ghost }
            }

            Behavior on visible {
                SequentialAnimation {
                    ParallelAnimation {
                        NumberAnimation {
                            target      : appLauncher
                            properties  : "opacity"
                            to          : 0
                            duration    : 500
                        }

                        NumberAnimation {
                            target      : ghost
                            properties  : "x"
                            to          : 0
                            duration    : 800
                        }

                        NumberAnimation {
                            target      : ghost
                            property    : "height"
                            to          : ghostLayout.height
                            duration    : 800
                        }

                        NumberAnimation {
                            target      : ghost
                            property    : "y"
                            to          : ghostLayout.y
                            duration    : 800
                        }

                        NumberAnimation {
                            target      : ghost
                            property    : "radius"
                            to          : 0
                            duration    : 800
                        }
                    }

                    PauseAnimation {
                        duration    : 50
                    }

                    NumberAnimation {
                        target      : ghost
                        property    : "width"
                        to          : ghostLayout.width
                        duration    : 1000
                    }
                }
            }
        }
    }
}

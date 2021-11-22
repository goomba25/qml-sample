import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtGraphicalEffects 1.0

Window {
    id: root
    width: 1403
    height: 778
    visible: true
    title: qsTr("Hello World")

    Item {
        property int    progressbarHeight   : 12
        property real   mediaCount          : 23
        property real   mediaTitleSize      : 38
        property real   mediaTimeSize       : 38
        property real   mediaCountSize      : 25
        property real   mediaArtistSize     : 34
        property string mediaTitle          : "Media Title"
        property string mediaArtist         : "Artist"
        property string mediaImageSource
        property string mediaPlayTime       : "00:12"
        property string mediaFullTime       : "02:50"
        property var backgroundColor        : "#lightgrey"
        property string bluetoothConnectName: "Q9"

        id              : mainitem
        anchors.fill    : parent

        Rectangle {
            anchors.fill    : parent
            color           : mainitem.backgroundColor
            opacity         : 0.6

            Image {
                id              : backimg
                source          : musicImage.source
                opacity         : 0.1
                anchors.fill    : parent
            }
        }

        RowLayout {
            spacing                 : 21
            anchors.fill            : parent
            anchors.topMargin       : 139
            anchors.leftMargin      : 83
            anchors.rightMargin     : 147
            anchors.bottomMargin    : 53

            // Left Layout
            ColumnLayout {
                id                      : mediaControlLayout
                Layout.fillHeight       : true
                width                   : 800
                spacing                 : 0
                Layout.alignment        : Qt.AlignTop

                Rectangle {
                    id                      : mediaTitleRect
                    Layout.alignment        : Qt.AlignCenter
                    Layout.fillWidth        : true
                    implicitHeight          : 52
                    color                   : "transparent"

                    Text {
                        id                      : mediaTitleText
                        text                    : mainitem.mediaTitle
                        font.weight             : Font.DemiBold
                        font.family             : "Noto Sans"
                        font.pixelSize          : mainitem.mediaTitleSize
                        color                   : "white"
                    }
                }

                Rectangle {
                    id                      : mediaArtistRect
                    Layout.fillWidth        : true
                    Layout.topMargin        : 10
                    implicitHeight          : 46
                    color                   : "transparent"

                    Text {
                        id                      : mediaArtistText
                        text                    : mainitem.mediaArtist
                        font.pixelSize          : mainitem.mediaArtistSize
                        font.family             : "Noto Sans"
                        color                   : "white"
                        opacity                 : 0.6
                    }
                }

                RowLayout {
                    Layout.topMargin        : 144
                    Layout.bottomMargin     : 0
                    Layout.leftMargin       : 64
                    Layout.rightMargin      : 76
                    spacing                 : 40

                    ListModel {
                        id          : buttons
                        ListElement { name : "1" }
                        ListElement { name : "2" }
                        ListElement { name : "3" }
                        ListElement { name : "4" }
                        ListElement { name : "5" }
                    }

                    Repeater {
                        model: buttons

                            Button {
                                text                : model.name
                                implicitWidth       : 100
                                implicitHeight      : 100
                            }
                    }
                }

                Rectangle {
                    Layout.alignment        : Qt.AlignTop
                    Layout.fillWidth        : true
                    Layout.topMargin        : 60
                    Layout.bottomMargin     : 130
                    height                  : 43
                    color                   : "transparent"

                    ProgressBar {
                        id                      : progressbar
                        value                   : 0.05
                        implicitHeight          : 10
                        anchors.centerIn        : parent
                        width                   : parent.width
                    }
                }
            }

            // Right Layout
            ColumnLayout {
                id                  : mediaImageInfoLayout
                Layout.fillWidth    : true
                Layout.fillHeight   : true
                spacing: 0

                Rectangle {
                    id                  : musicImageRect
                    Layout.alignment    : Qt.AlignLeft | Qt.AlignTop
                    height              : 352
                    width               : 352
                    radius              : 20
//                    layer.enabled       : true

                    Image {
                        id              : musicImage
                        source          : "app_resources_album.png"
                        anchors.fill    : parent
                        fillMode        : Image.PreserveAspectCrop
                        layer.enabled   : true
                        layer.effect    : OpacityMask {
                            maskSource      : musicImageRect
                        }
                    }
                }

                Rectangle {
                    Layout.alignment    : Qt.AlignTop
                    Layout.fillWidth    : true
                    Layout.topMargin    : 60
                    height              : 43
                    color:  "transparent"

                    Text {
                        id                  : playTime
                        text                : mainitem.mediaPlayTime + " / " + mainitem.mediaFullTime
                        font.family         : "Noto Sans"
                        font.pixelSize      : 32
                        font.weight         : Font.Medium
                        color               : "white"
                        opacity             : 0.6
                    }
                }

                RowLayout {
                    Layout.topMargin    : 70
                    Layout.fillWidth    : true
                    spacing             : 10
                    Layout.alignment    : Qt.AlignVCenter | Qt.AlignRight

                    Rectangle {
                        Layout.leftMargin   : 92
                        width               : 50
                        height              : 50
                        color               : "transparent"

                        Image {
                            anchors.fill    : parent
                            source          : "app_resources_1dpi_normal_BtMusic_bt.png"
                            fillMode        : Image.PreserveAspectFit
                        }
                    }

                    Button {
                        implicitWidth       : Math.max(200, implicitWidth)
                        implicitHeight      : Math.max(60, implicitHeight)
                        text                : mainitem.bluetoothConnectName
                        font.pixelSize      : 32
                        font.family         : "Noto Sans"

                        background:
                            Rectangle {
                                anchors.fill    : parent
                                color           : "#393C3D"
                                opacity         : 0.6
                                border.color    : "white"
                                border.width    : 1
                                radius          : 10
                            }
                    }
                }
            }
        }
    }
}

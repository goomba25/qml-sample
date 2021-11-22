import QtQuick 2.11
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Window 2.1

Window {
    width: 1408
    height: 778
    visible: true
    color: "black"

    Item {
        id: idSoundSetting

        readonly property string sEmpty     : ""
        readonly property string sFontFamily: "Noto Sans"
        readonly property int iFontSize     : 32    // pixel
        readonly property int iVerSpacing   : 30
        readonly property int iHorSpacing   : 20

        Rectangle {
            id: idRect_screen_setting_bg
            anchors.fill: parent
            color: "transparent"
        }

        ColumnLayout {
            id                      : idColumnLayout
            anchors.fill            : parent
            anchors.topMargin       : 0
            anchors.leftMargin      : 50
            anchors.rightMargin     : 83
            anchors.bottomMargin    : 60

            Item {
                id                  : idTitleLabel
                Layout.fillWidth    : true
                implicitHeight      : 50

                Text {
                    id                  : idTitleLabelText
                    anchors.fill        : parent
                    text                : "Sound Setting"
                    font.pixelSize      : idSoundSetting.iFontSize
                    font.family         : idSoundSetting.sFontFamily
                    horizontalAlignment : Text.AlignLeft
                    verticalAlignment   : Text.AlignVCenter
                    color               : "white"
                    opacity             : 0.6
                    font.weight         : Font.DemiBold
                }
            }

            RowLayout {
                Layout.fillWidth    : true
                Layout.topMargin    : 30
                height              : 50

                Rectangle {
                    id                  : idSystemVolumeLabel
    //                Layout.fillWidth    : true
                    implicitHeight      : 50
                    implicitWidth       : 177
                    color: "transparent"

                    Text {
                        id                  : idSystemVolumeLabelText
                        anchors.fill        : parent
                        text                : "System"
                        font.pixelSize      : idSoundSetting.iFontSize
                        font.family         : idSoundSetting.sFontFamily
                        horizontalAlignment : Text.AlignLeft
                        verticalAlignment   : Text.AlignVCenter
                        color               : "white"
                    }
                }

                Rectangle {
                    id                  : idSystemVolumeNum
                    Layout.fillWidth    : true
                    implicitWidth       : 50
                    implicitHeight      : 50
//                    width: 50
//                    height: 50
                    Layout.leftMargin  : 30
                    color: "red"
                }
            }
        }

    }
}

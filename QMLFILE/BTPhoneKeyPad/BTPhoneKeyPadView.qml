import QtQuick 2.11
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

Window {
    width: 1403
    height: 778
    visible: true
    title: qsTr("KeyPad")

    function numberPhone(value) {
        value = value.replace(/[^0-9]/g, "");

        let frontNumber = "";
        let restNumber = "";
        let result = "";

        // local number
        if (value.startsWith("02")) {
          frontNumber = value.substr(0, 2);
          restNumber = value.substring(2);
        } else if (value.startsWith("1")) {
          restNumber = value;
        } else {
          frontNumber = value.substr(0, 3);
          restNumber = value.substring(3);
        }

        // xxx-yyyy
        if (restNumber.length > 8) {
            result = [frontNumber, restNumber].join('')
        } else if (restNumber.length === 7) {
            result = [frontNumber, restNumber.substring(0, 3), restNumber.substring(3)].join('-')
        } else if (restNumber.length < 1) {
            result = frontNumber
        } else if (restNumber.length < 5) {
            result = [frontNumber, restNumber.substring(0, 4)].join('-')
        } else {
            result = [frontNumber, restNumber.substring(0, 4), restNumber.substring(4)].join('-')
        }

        idText_TargetNumber.text = result
    }

    Item {
        anchors.fill: parent

        Rectangle {
            anchors.fill    : parent
            color: "#141719"
        }

        RowLayout {
            anchors.fill        : parent
            anchors.topMargin   : 44
            anchors.leftMargin  : 220
            anchors.rightMargin : 147
            anchors.bottomMargin: 42

            ColumnLayout {
                Item {
                    id                  : idRect_TargetName
                    width               : 400
                    height              : 46

                    Text {
                        id                  : idText_TargetName
                        text                : "Mom"
                        color               : "#FFFFFF"
                        font.pixelSize      : 32
                        opacity             : 0.6
                        horizontalAlignment : Qt.AlignLeft
                        verticalAlignment   : Qt.AlignVCenter
                    }
                }

                Item {
                    id                  : idRect_TargetNumber
                    Layout.topMargin    : 5
                    width               : 400
                    height              : 46

                    property int cnt: 0

                    Text {
                        id                  : idText_TargetNumber
                        text                : ""
                        color               : "#FFFFFF"
                        font.pixelSize      : 34
                        font.letterSpacing  : 6
                        horizontalAlignment : Qt.AlignLeft
                        verticalAlignment   : Qt.AlignVCenter

                        onTextChanged: {
                            text = numberPhone(idText_TargetNumber.text)
                        }
                    }
                }

                GridLayout {
                    id                  : idGrid_NumberKeyPad
                    columns             : 3
                    Layout.topMargin    : 30
                    Layout.fillHeight   : true
                    columnSpacing       : 73
                    rowSpacing          : 35
                    Layout.alignment    : Qt.AlignHCenter

                    Repeater {
                        model   : 9

                        Item {
                            width   : 85
                            height  : 85

                            Image {
                                anchors.fill    : parent
                                source          : "qrc:/button" + (index+1)

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked   :{
                                        idText_TargetNumber.text = idText_TargetNumber.text + (index+1)
                                    }
                                }
                            }
                        }
                    }

                    Item {
                        id      : idItem_Asterisk
                        width   : 85
                        height  : 85

                        Image {
                            anchors.fill    : parent
                            source          : "qrc:/asterisk"

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    idText_TargetNumber.text = idText_TargetNumber.text + ('*')
                                }
                            }
                        }
                    }

                    Item {
                        id      : idItem_0
                        width   : 85
                        height  : 85

                        Image {
                            anchors.fill    : parent
                            source          : "qrc:/button0"

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    idText_TargetNumber.text = idText_TargetNumber.text + ('0')
                                }
                            }
                        }
                    }

                    Item {
                        id      : idItem_Pound
                        width   : 85
                        height  : 85

                        Image {
                            anchors.fill    : parent
                            source          : "qrc:/pound"

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    idText_TargetNumber.text = idText_TargetNumber.text + ('#')
                                }
                            }
                        }
                    }
                }

                RowLayout {
                    id                  : idRow_CallKeyPad
                    Layout.topMargin    : 43
                    Layout.leftMargin   : 158

                    Item {
                        id      : idItem_Call
                        width   : 85
                        height  : 85

                        Image {
                            id              : idImage_Call
                            anchors.fill    : parent
                            source          : "qrc:/call"

                            MouseArea {
                                anchors.fill    : parent
                                onClicked: {
                                    if (idImage_Call.source == "qrc:/call") {
                                        idImage_Call.source = "qrc:/CallEnd"
                                    } else {
                                        idImage_Call.source = "qrc:/call"
                                    }
                                }
                            }
                        }
                    }

                    Item {
                        id                  : idItem_Delete
                        width               : 85
                        height              : 85
                        Layout.leftMargin   : 73

                        Image {
                            id              : idImage_Delete
                            anchors.centerIn: parent
                            source          : "qrc:/delete"

                            MouseArea {
                                anchors.fill    : parent
                                onClicked: {
                                    if (idText_TargetNumber.text.length > 0) {
                                        idText_TargetNumber.text = idText_TargetNumber.text.substring(0, idText_TargetNumber.text.length - 1)
                                    }
                                }
                            }
                        }
                    }
                }
            }

            ColumnLayout {
                Layout.topMargin        : 122
                Layout.leftMargin       : 188
                anchors.bottomMargin    : 11

                ColumnLayout {
                    id                  : idCol_AddressList
                    Layout.rightMargin  : 219

                    height              : 454   // remove
                    width               : 240   // remove

                    Rectangle {
                        anchors.fill    : parent
                        color           : "lightgray"
                    }
                }


                RowLayout {
                    id                  : idRow_BT
                    Layout.topMargin    : 45
                    Layout.bottomMargin : 5
                    anchors.right       : parent.right

                    Rectangle {     //  image
                        id                  : idImage_BT
                        width               : 50
                        height              : 50
                        Layout.topMargin    : 5
                        Layout.bottomMargin : 5

                        color           : "lightblue"
                    }

                    Rectangle {     //  CButton2
                        id                  : idCButton_BT
                        width               : 200
                        height              : 60
                        Layout.leftMargin   : 10

                        color           : "#393C3D"

                        Text {
                            text                : qsTr("Q9")
                            font.pixelSize      : 32
                            font.family         : "Noto Sans"
                            opacity             : 0.6
                            color               : "#FFFFFF"
                            anchors.centerIn    : parent
                        }
                    }
                }
            }
        }
    }
}

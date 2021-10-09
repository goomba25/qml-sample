import QtQuick 2.11
import QtQuick.Layouts 1.2
import QtGraphicalEffects 1.0

Item {
    property int appSpacing : 30
    property int appWidth   : 250
    property int appHeight  : 500
    property int margine    : 50

    id              : idItem_Root
    anchors.fill    : parent

    AppListModel {
        id      : idListModel_App
    }

    RowLayout {
        id                      : idRowLayout_App
        anchors.fill            : parent

        ListView {
            id                      : idListView_App
            Layout.fillHeight       : true
            Layout.fillWidth        : true
            orientation             : ListView.Horizontal
            boundsMovement          : Flickable.StopAtBounds
            clip                    : true
            spacing                 : appSpacing
            model                   : idListModel_App

            delegate: AppDelegate {
                id                      : idDelegate_App
                width                   : appWidth
                height                  : appHeight
                itemColor               : model.color
                textColor               : model.tColor
                imageSource             : model.image
                anchors.verticalCenter  : parent.verticalCenter

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log(parent.parent, idListView_App)
                        idListView_App.currentIndex = index

                        if (idListView_App.currentIndex === (idListModel_App.count - 1)) {
                            idListModel_App.insert(
                                        (idListModel_App.count - 1),
                                        { "name" : "a" + (idListModel_App.count - 1),
                                            "color" : "gray", "tColor" : "#FFFFFF" })
                        } else {
                            idRect_Ghost.x = idListView_App.currentItem.x - idListView_App.contentX
                            idRect_Ghost.visible = true
                            idDelegate_App.visible = false
                        }
                    }
                }
            }

            onOpacityChanged: {
                if (idListView_App.opacity == 0) {
                    console.log("opacity 0")
                    idListView_App.visible = false
                }
            }
        }
    }

    RowLayout {
        id              : idRowLayout_Ghost
        anchors.fill    : parent

        Rectangle {
            id                      : idRect_Ghost
            y                       : idListView_App.currentItem.y
            width                   : appWidth
            height                  : appHeight
            radius                  : 20
            color                   : idListView_App.currentItem.itemColor
            visible                 : false

            Image {
                id              : idImage_Ghost
                source          : idListView_App.currentItem.imageSource
                anchors.fill    : parent
                fillMode        : Image.PreserveAspectCrop
                layer.enabled   : true
                layer.effect    : OpacityMask { maskSource: idRect_Ghost }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log(idListView_App.children)
                }
            }

            Behavior on visible {
                SequentialAnimation {
                    ParallelAnimation {
                        NumberAnimation {
                            target      : idListView_App
                            properties  : "opacity"
                            to          : 0
                            duration    : 500
                        }

                        NumberAnimation {
                            target      : idRect_Ghost
                            properties  : "x"
                            to          : 0
                            duration    : 800
                        }

                        NumberAnimation {
                            target      : idRect_Ghost
                            property    : "height"
                            to          : idRowLayout_Ghost.height
                            duration    : 800
                        }

                        NumberAnimation {
                            target      : idRect_Ghost
                            property    : "y"
                            to          : idRowLayout_Ghost.y
                            duration    : 800
                        }

                        NumberAnimation {
                            target      : idRect_Ghost
                            property    : "radius"
                            to          : 0
                            duration    : 800
                        }
                    }

                    PauseAnimation {
                        duration    : 50
                    }

                    ParallelAnimation {
                        NumberAnimation {
                            target      : idRect_Ghost
                            property    : "width"
                            to          : idItem_Root.width
                            duration    : 1000
                        }
                    }
                }
            }
        }
    }
}

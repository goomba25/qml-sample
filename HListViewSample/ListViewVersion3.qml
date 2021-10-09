import QtQuick 2.11
import QtQuick.Layouts 1.2

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
        anchors.topMargin       : margine
        anchors.bottomMargin    : margine

        ListView {
            id                  : idListView_App
            Layout.fillHeight   : true
            Layout.fillWidth    : true
            orientation         : ListView.Horizontal
            boundsMovement      : Flickable.StopAtBounds
//            clip                : true
            spacing             : appSpacing
            model               : idListModel_App

            delegate: AppDelegate {
                id              : idDelegate_App
                width           : appWidth
                height          : idRowLayout_App.height
                itemColor       : model.color
                textColor       : model.tColor

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
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

    Rectangle {
        id              : idRect_Ghost
        y               : margine
        width           : appWidth
        height          : idItem_Root.height - (margine * 2)
        color           : idListView_App.currentItem.itemColor
        radius          : 20
        border.width    : 2
        border.color    : "#FFFFFF"
        visible         : false


        Behavior on visible {
            SequentialAnimation {
                ParallelAnimation {
                    NumberAnimation {
                        target      : idListView_App
                        properties  : "opacity"
                        to          : 0
                        duration    : 100
                    }

                    NumberAnimation {
                        target      : idRowLayout_App
                        properties  : "anchors.topMargin, anchors.bottomMargin"
                        to          : 150
                        duration    : 100
                    }

                    NumberAnimation {
                        target      : idRect_Ghost
                        properties  : "x"
                        to          : 0
                        duration    : 300
                    }
                }

                PauseAnimation {
                    duration    : 50
                }

                ParallelAnimation {
                    NumberAnimation {
                        target      : idRect_Ghost
                        properties  : "width"
                        to          : idItem_Root.width
                        duration    : 100
                    }

                    NumberAnimation {
                        target      : idRect_Ghost
                        properties  : "y"
                        to          : 0
                        duration    : 100
                    }

                    NumberAnimation {
                        target      : idRect_Ghost
                        properties  : "height"
                        to          : idItem_Root.height
                        duration    : 100
                    }
                }
            }
        }
    }
}

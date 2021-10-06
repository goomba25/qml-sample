import QtQuick 2.11
import QtQuick.Layouts 1.2

Item {
    property int appSpacing : 30
    property int appWidth   : 250

    id              : idItem_Root
    anchors.fill    : parent

    AppListModel {
        id      : idListModel_App
    }

    RowLayout {
        id                      : idRowLayout_App
        anchors.fill            : parent
        anchors.topMargin       : 100
        anchors.bottomMargin    : 100

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
                itemText        : model.name
                textColor       : model.tColor

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        idListView_App.currentIndex = index
                        idListView_App.currentItem.visible = false
                        idApp_Ghost.state = "visibleOn"
                    }
                }
            }
        }
    }

    AppDelegate {
        id          : idApp_Ghost
        x           : 100 /*idListView_App.currentItem.x - idListView_App.contentX*/
        y           : 100
        width       : appWidth
        height      : idListView_App.height
        itemColor   : idListView_App.currentItem.itemColor
        visible     : false

        state: "visibleOff"

        states: [
            State {
                name: "visibleOn"
                PropertyChanges { target: idApp_Ghost; visible: true; }
                PropertyChanges { target: idApp_Ghost; x: 0; }
            },
            State {
                name: "sizeUp"
//                PropertyChanges { target: idApp_Ghost; visible: true; }
//                PropertyChanges { target: idApp_Ghost; x: 200; }
//                PropertyChanges { target: idApp_Ghost; width: idItem_Root.width; }
            }
        ]

        transitions: [
            Transition {
                from: "visibleOff"
                to: "visibleOn"
            },

            Transition {
                from: "visibleOn"
                to: "sizeUp"
//                PropertyAnimation { target: idApp_Ghost; property: "width"; duration: 1000; }
            }
        ]

        MouseArea {
            anchors.fill: parent
            onClicked: {
                parent.state = "sizeUp"
            }
        }
    }
}

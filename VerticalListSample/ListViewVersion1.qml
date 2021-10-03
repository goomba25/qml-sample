import QtQuick 2.11
import QtQuick.Layouts 1.2

Item {
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
            clip                : true
            spacing             : 30
            model               : idListModel_App


            delegate: AppDelegate {
                id              : idDelegate_App
                width           : 250
                height          : idRowLayout_App.height
                itemColor       : model.color
                itemText        : model.name
                textColor       : model.tColor

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (index === (idListModel_App.count - 1)) {
                            idListModel_App.insert(
                                        (idListModel_App.count - 1),
                                        { "name" : "a" + (idListModel_App.count - 1),
                                            "color" : "gray", "tColor" : "#FFFFFF" })
                        } else {
                            idListView_App.currentIndex = index
//                            idRect_Ghost.visible = true
                        }
                    }
                }
            }
        }
    }

    Rectangle {
        id      : idRect_Ghost
        x       : idListView_App.currentItem.x - idListView_App.contentX
        y       : idRowLayout_App.y
        width   : 250
        height  : idListView_App.height
//            visible : false

        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log(idRect_Ghost.x, idRect_Ghost.y)

                idRect_Ghost.x = 0
                idRect_Ghost.y = 0
                idRect_Ghost.width = idItem_Root.width
                idRect_Ghost.height = idItem_Root.height
            }
        }
    }
}

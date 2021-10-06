import QtQuick 2.11
import QtQuick.Layouts 1.2

Item {
    anchors.fill: parent

    AppListModel {
        id          : idListModel_App
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

            highlight                   : idCompo_Ghost
            highlightFollowsCurrentItem : true
            focus                       : true

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
                            idListModel_App.insert((idListModel_App.count - 1),
                                                    { "name" : "a" + (idListModel_App.count - 1),
                                                        "color" : "gray", "tColor" : "#FFFFFF" })
                        }
                        idListView_App.currentIndex = index

                        console.log(idListView_App.contentX)
                    }
                }
            }
        }
    }

    Component {
        id  : idCompo_Ghost

        Rectangle {
            width   : 250
            height  : 500
            x       : idListView_App.currentItem.x - idListView_App.contentX
        }
    }
}

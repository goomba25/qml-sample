import QtQuick 2.12
import QtQuick.Layouts 1.2

Item {
    anchors.fill: parent

    AppListModel {
        id          : idListModel_Rect
    }

    RowLayout {
        id                      : idRowLayout_List
        anchors.fill            : parent
        anchors.leftMargin      : 76
        anchors.topMargin       : 50
        anchors.bottomMargin    : 50

        Item {
            id                  : idItem_List
            Layout.fillWidth    : true
            Layout.fillHeight   : true

            ListView {
                id                  : idListView_Rect
                orientation         : ListView.Horizontal
                boundsMovement      : Flickable.StopAtBounds
                clip                : true
                spacing             : 30
                model               : idListModel_Rect


                delegate: ListDelegate {
                    id          : idDelegate_Rect
                    width       : 250
                    height      : idItem_List.height
                    itemColor   : model.color
                    itemText    : model.name
                    textColor   : model.tColor
                    anchors.verticalCenter: parent.verticalCenter

                    MouseArea {
                        id  : mouse
                        anchors.fill: parent
                        onClicked: {
                            var listCount = index

                            if (listCount === (idListModel_Rect.count - 1)) {
                                idListModel_Rect.insert((idListModel_Rect.count - 1),
                                                        { "name" : "a" + (idListModel_Rect.count - 1),
                                                            "color" : "gray", "tColor" : "#FFFFFF" })
                            }
                        }
                    }
                }
            }
        }
    }

    Rectangle {
        id          : idRect_Test
        visible     : false
        radius      : 20
        y           : 150
    }
}

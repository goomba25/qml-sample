import QtQuick 2.11
import QtQuick.Layouts 1.3

Item {
    anchors.fill: parent

    AppListModel {
        id          : idListModel_Rect
    }

//    Component {
//        id  : idCompo_Ghost

//        Rectangle {
//            width   : 250
//            height  : 500
//            x       : idListView_Rect.currentItem.x
//        }
//    }

    RowLayout {
        id                  : idRowLayout_List
        anchors.fill        : parent

        ListView {
            id                          : idListView_Rect
            orientation                 : ListView.Horizontal
            boundsMovement              : Flickable.StopAtBounds
            clip                        : true
            spacing                     : 30
            model                       : idListModel_Rect
//            highlight                   : idCompo_Ghost
//            highlightFollowsCurrentItem : true
//            focus                       : true

            delegate: ListDelegate {
                id                      : idDelegate_Rect
                width                   : 250
                height                  : 500
                itemColor               : model.color
                itemText                : model.name
                textColor               : model.tColor
                anchors.verticalCenter  : parent.verticalCenter

//                MouseArea {
//                    id              : idMouse_Delegate
//                    anchors.fill    : parent

//                    onClicked: {
//                        if (index == (idListModel_Rect.count - 1)) {
//                            idListModel_Rect.insert(
//                                        (idListModel_Rect.count - 1),
//                                        {"name" : "a" + (idListModel_Rect.count - 1),
//                                        "color" : "transparent",
//                                        "tColor" : "#FFFFFF"})
//                        }
//                    }
//                }
            }
        }
    }
}

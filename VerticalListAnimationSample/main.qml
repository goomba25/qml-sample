import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.2

Window {
    id      : root
    width   : 1408
    height  : 778
    visible : true
    title   : qsTr("Vertical List")
    color   : "gray"
    flags   : Qt.WindowStaysOnTopHint

    ListModel {
        id          : idListModel_Rect
        ListElement { name : "a0"; color : "#FAEBD7"; tColor : "#000000";}
        ListElement { name : "a1"; color : "#7A2BE2"; tColor : "#FFFFFF";}
        ListElement { name : "a2"; color : "#FF7F50"; tColor : "#000000";}
        ListElement { name : "a3"; color : "#008B8B"; tColor : "#FFFFFF";}
        ListElement { name : "a4"; color : "#D2691E"; tColor : "#FFFFFF";}
        ListElement { name : "a5"; color : "#006400"; tColor : "#FFFFFF";}
        ListElement { name : "a6"; color : "#DC143C"; tColor : "#FFFFFF";}
        ListElement { name : "a7"; color : "#00BFFF"; tColor : "#000000";}
        ListElement { name : "+"; color : "transparent"; tColor : "#FFFFFF"; }
    }

    //  version 1.0 - ListView
    RowLayout {
        id                      : idRowLayout_List
        anchors.fill            : parent
        anchors.leftMargin      : 76
        anchors.topMargin       : 50
        anchors.bottomMargin    : 50
        visible                 : false

        Item {
            id                  : idItem_List
            Layout.fillWidth    : true
            Layout.fillHeight   : true

            ListView {
                id                  : idListView_Rect
                anchors.fill        : parent
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
//                            parent.visible = false

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

    //  version 2.0
    RowLayout {
        id              : idRowLayout_ItemList
        anchors.fill    : parent
        visible         : true

        Flickable {
            id                  : idFlickable_ItemList
            Layout.fillHeight   : true
            Layout.fillWidth    : true
            boundsMovement      : Flickable.StopAtBounds
            flickableDirection  : Flickable.HorizontalFlick
            contentWidth        : width * 5 / 3

            RowLayout {
                id                      : idRowLayout_Repeat
                anchors.verticalCenter  : parent.verticalCenter
                spacing                 : 30

                Repeater {
                    id          : idRepeat_Items
                    model       : idListModel_Rect

                    ListDelegate {
                        id                      : idDelegate_Item
                        width                   : 200
                        height                  : 500
                        itemColor               : model.color
                        itemText                : model.name
                        textColor               : model.tColor

                        MouseArea {
                            id              : idMouse_Delegate
                            anchors.fill    : parent

                            onClicked: {
                                console.log("click")

                                if (index === (idListModel_Rect.count - 1)) {
                                    idListModel_Rect.insert(
                                                (idListModel_Rect.count - 1),
                                                { "name" : "a" + (idListModel_Rect.count - 1),
                                                    "color" : "gray", "tColor" : "#FFFFFF" })

                                    idFlickable_ItemList.contentWidth += (idDelegate_Item.width + idRowLayout_Repeat.spacing)
                                }
                                idRect_Test.visible = true
                                idRect_Test.color = model.color
                                idRect_Test.width = width
                                idRect_Test.height = height
                                idRect_Test.x = idDelegate_Item.x
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

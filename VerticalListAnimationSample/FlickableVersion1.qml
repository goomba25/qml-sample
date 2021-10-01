import QtQuick 2.12
import QtQuick.Layouts 1.2

Item {
    anchors.fill: parent

    AppListModel {
        id          : idListModel_Rect
    }

    RowLayout {
        id              : idRowLayout_ItemList
        anchors.fill    : parent

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

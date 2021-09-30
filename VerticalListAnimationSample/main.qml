import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.2

Window {
    width   : 600
    height  : 300
    visible : true
    title   : qsTr("Vertical List")
    color   : "gray"

    RowLayout {
        anchors.fill        : parent

        Item {
            id                  : idItem_Root
            Layout.topMargin    : 50
            Layout.bottomMargin : 50
            width               : 600
            height              : 200

            ListModel {
                id          : idListModel_Rect
                ListElement { name : "a1"; color : "#FAEBD7"; tColor : "#000000";}
                ListElement { name : "a2"; color : "#7A2BE2"; tColor : "#FFFFFF";}
                ListElement { name : "a3"; color : "#FF7F50"; tColor : "#000000";}
                ListElement { name : "a4"; color : "#008B8B"; tColor : "#FFFFFF";}
                ListElement { name : "a5"; color : "#D2691E"; tColor : "#FFFFFF";}
                ListElement { name : "a6"; color : "#006400"; tColor : "#FFFFFF";}
                ListElement { name : "a7"; color : "#DC143C"; tColor : "#FFFFFF";}
                ListElement { name : "a8"; color : "#00BFFF"; tColor : "#000000";}
            }


            ListView {
                id                  : idListView_Rect
                anchors.fill        : parent
                anchors.leftMargin  : 50
                anchors.rightMargin : 50
                orientation         : ListView.Horizontal
                spacing             : 10
                clip                : true
                model               : idListModel_Rect

                delegate: ListDelegate {
                    id          : idDelegate_Rect
                    width       : 100
                    height      : idItem_Root.height
                    itemColor   : model.color
                    itemText    : model.name
                    textColor   : model.tColor

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                        }
                    }
                }
            }
        }
    }
}

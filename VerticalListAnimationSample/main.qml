import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.2

Window {
    id      : root
    width   : 1408 - 76
    height  : 778
    visible : true
    title   : qsTr("Vertical List")
    color   : "gray"
    flags   : Qt.WindowStaysOnTopHint

    ListModel {
        id          : idListModel_App
        ListElement { name : "ListView1" }
        ListElement { name : "Flickable1" }
        ListElement { name : "ListView2" }
    }

    ListViewVersion1 {
        id      : id_ListView1
        visible : true
    }

    FlickableVersion1 {
        id      : id_Flickable1
        visible : false
    }

    ListViewVersion2 {
        id      : id_ListView2
        visible : false
    }
}

import QtQuick 2.12
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.2

ApplicationWindow {
    id          : root
    width       : 640
    height      : 480
    visible     : true

    ListModel {
        id      : idListModel
        ListElement { name : "apple" }
        ListElement { name : "orange" }
        ListElement { name : "melon" }
    }

    Component {
        id : idDelegation
        Text {
            text                : name
            font.pixelSize      : 24
            anchors.left        : parent.left
            anchors.leftMargin  : 10
        }
    }

    Component {
        id : idBannerDelegation
        Rectangle {
            id          : banner
            width       : root.width
            height      : 50
            border { width: 2; color: "lightgray" }

            Text {
                anchors.centerIn    : parent
                text                : "Banner"
                font.pixelSize      : 32
            }
        }
    }

    ListView {
        id              : idListView
        anchors.fill    : parent
        model           : idListModel
        delegate        : idDelegation
        header          : idBannerDelegation
        footer          : Rectangle {
            width   : parent.width
            height  : 30
        }
        highlight       : Rectangle {
            color   : "yellow"
            x       : 10
        }
        focus           : true
    }
}

import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width   : 1408 - 76
    height  : 778
    visible : true
    title   : "Sample"
    flags   : Qt.WindowStaysOnTopHint
    color   : "lightgray"

    // Rectangle Alone
    ListViewVersion1 {
        visible: true
    }

    // Highlight
    ListViewVersion2 {
        visible: false
    }

    ListViewVersion3 {
        visible: false
    }
}

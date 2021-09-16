import QtQuick 2.12
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    width       : 400
    height      : 300
    visible     : true

    GridLayout {
        anchors.fill    : parent
        columnSpacing   : 10
        rowSpacing      : 10
        columns         : 3

        Button { text : "button 1" }
        Button { text : "button 2" }
        ColumnLayout {
            Label { text : "label 3A" }
            Label { text : "label 3B" }
        }
        Button { text : "button 4" }
        Button { text : "button 5" }
    }
}

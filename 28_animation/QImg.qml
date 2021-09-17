import QtQuick 2.0

Item {
    id              : idItem_ImageCompo
    anchors.fill    : parent

    Image {
        id              : idImage_logo
        anchors.fill    : parent
        source          : "qtlogo.png"
        fillMode        : Image.PreserveAspectFit
    }
}

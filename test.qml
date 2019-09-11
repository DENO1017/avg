import QtQuick 2.0

Item {
    PathView {
        id: pathView
        x: 203
        y: 136
        width: 250
        height: 130
        path: Path {
            startY: 258
            startX: 158

            PathCubic {
                x: 120
                y: 25
                control1X: 213.333
                control2Y: 58.333
                control1Y: 83.333
                control2X: 213.333
            }

            PathCubic {
                x: 158
                y: 258
                control1X: 26.667
                control2Y: 83.333
                control1Y: 58.333
                control2X: 26.667
            }
        }
        delegate: Column {
            Rectangle {
                width: 40
                height: 40
                color: colorCode
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                x: 5
                text: name
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: true
            }
            spacing: 5
        }
        model: ListModel {
            ListElement {
                name: "Grey"
                colorCode: "grey"
            }

            ListElement {
                name: "Red"
                colorCode: "red"
            }

            ListElement {
                name: "Blue"
                colorCode: "blue"
            }

            ListElement {
                name: "Green"
                colorCode: "green"
            }
        }
    }

    ListView {
        id: listView
        x: 35
        y: 46
        width: 110
        height: 345
        delegate: Item {
            x: 5
            width: 80
            height: 40
            Row {
                id: row1
                Rectangle {
                    width: 40
                    height: 40
                    color: colorCode
                }

                Text {
                    text: name
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
                spacing: 10
            }
        }
        model: ListModel {
            ListElement {
                name: "Grey"
                colorCode: "grey"
            }

            ListElement {
                name: "Red"
                colorCode: "red"
            }

            ListElement {
                name: "Blue"
                colorCode: "blue"
            }

            ListElement {
                name: "Green"
                colorCode: "green"
            }
        }
    }

}

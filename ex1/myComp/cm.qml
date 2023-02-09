import QtQuick 2.0

Component {
    id: rectComp;
    color: "black"
    Rectangle {
        id :rect
        color: rectComp.color
        width: rectComp.width
        height: rectComp.height
        MouseArea {
            width: rect.width; height: rect.height;
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onPressed: {
                if (pressedButtons == Qt.RightButton)
                    rect.color = "blue";
                else if (pressedButtons == Qt.LeftButton)
                    rect.color = "green";
            }
                onDoubleClicked: {
                Qt.quit();
            }
            onPositionChanged: {
                console.log("X:" + mouseX + " Y:" + mouseY)
            }
        } 
    }
}

import QtQuick 2.0


Item {
    id: root
    property color color: "black"
    height: 20
    width: 20
    
 
    QtObject {
        id: rectCompSetting    
        property int height: root.height;
        property int width: root.width;
        property color color: root.color;
    }

    Rectangle {
        id :rect
        color: rectCompSetting.color;
        width: 100
        height: 100
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




/*
Item{
    id :rect
    Rectangle {
        width: 80; height: 80
        color: "black"

        MouseArea {
            x: rect.x; y: rect.y;
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
            ++count;
            }
        } 
    }
}*/
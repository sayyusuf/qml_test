import QtQuick 2.0


import QtQuick 2.0

Item {
    id:root;
    property color color: "black"

    QtObject {
        id: rectCompSetting    
        property int height: root.height;
        property int width: root.width;
        property color color: root.color;
    }

    Component {
        id: rectComp
        
        Rectangle {
            id :rect
            color: rectCompSetting.color
            width: rectCompSetting.width
            height: rectCompSetting.height
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
    Loader { sourceComponent: rectComp }
}
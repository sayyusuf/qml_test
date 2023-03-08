import QtQuick 2.0

Item {
    id: root
    property string name: "default"
    property color color: "black"
    height: 20
    width: 20
    property variant radius: 0

    
    function action (){
        console.log("hiiiiiiiiiiiiiiiiiiiiii")
    }
    QtObject {
        id: rectCompSetting
        property int x: root.x;
        property int y: root.y;
        property int height: root.height;
        property int width: root.width;
        property color color: root.color;
        property variant radius: root.radius;
    }

    Rectangle {
        id :rect
        color: rectCompSetting.color;
        width: rectCompSetting.width;
        height: rectCompSetting.height;
        radius: rectCompSetting.radius;
        MouseArea {
            width: rect.width; height: rect.height;
            acceptedButtons: Qt.LeftButton | Qt.RightButton
        /*    onPressed: {
                if (pressedButtons == Qt.RightButton)
                    rect.color = "blue";
                else if (pressedButtons == Qt.LeftButton)
                    rect.color = "green";
            }*/
            Rectangle {
                id:subrect;
                visible: false;
                x: rectCompSetting.x + rect.width + 10;
                y: rectCompSetting.y;
                width: 700;
                height: 700;
                color: "red";
                radius: 10;
            }
            onClicked:{
                console.log(root.y)
                subrect.visible = !subrect.visible;
                rect.color = subrect.visible? "green": rectCompSetting.color;
                //var component = Qt.createComponent("comp.qml");
                //var object = component.createObject(mainWindow, {x: rectCompSetting.x + rect.width + 10, y: rectCompSetting.y, width: 700, height: 700, color: "red", radius: 10});
 
                action();
            }
        } 

    }


}


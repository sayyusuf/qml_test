import QtQuick 2.5
import QtQuick.Window 2.2
import QtQml 2.15
import QtQuick.Controls 1.4

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 1280
    height: 720
    title: qsTr("Hello World")
    property variant comps : []
    color: "yellow"

    Component{
        id: homeScreen
        Rectangle{
            x: 300; y: 300;
            height: 500
            width: 500
            color:"blue"
            //anchors.centerIn: mainWindow

            Text {
               // anchors.centerIn: parent
                text: qsTr("Home")
                font.pixelSize: 40
            }
        }
    }

    Component {
        id: rectComp;
        Rectangle {
            id :rect
            color: "red"
            MouseArea {
                width: rect.width; height: rect.height;
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                onPressed: {
                    if (pressedButtons == Qt.RightButton)
                        rect.color = "blue";
                    else if (pressedButtons == Qt.LeftButton)
                        rect.color = "green";
                }
                    onClicked: {
                        rectComp.createObject(rect, {width: rect.width, height: rect.height, x :rect.x + 150})
                }
                onPositionChanged: {
                    console.log("X:" + mouseX + " Y:" + mouseY)
                }
            } 

        }
    }

    function tt(){
        console.log("helloooooo")
    }
        Component.onCompleted: {
            var component = Qt.createComponent("comp.qml");
            var object = component.createObject(mainWindow, {x: 0, y: 100, width: 70, height: 70, color: "red", radius: 10});
            mainWindow.comps.push(object)
          //  var rectComp = Qt.createComponent("cm.qml")
            var object2 = rectComp.createObject(mainWindow, {x: 0, y: 200, width: 70, height: 70, color: "red", radius: 10});
            mainWindow.comps.push(object2)
            
        //    if (object.status == Component.Ready)
         //       console.log(dd,"ready");
    //        console.log(object.status,"ready");
        
        }

    StackView {
        id: stack
        initialItem: mainView
        anchors.fill: parent
    }

    Component {
        id: mainView
        Row {
            id: rr
            Loader { sourceComponent: rectComp; width: 100; height: 100;}
            spacing: 10

            Button {
                text: "Push"
                onClicked: stack.push(mainView)
            }
            Button {
                text: "Pop"
                enabled: stack.depth > 1
                onClicked: stack.pop()

            }
            Text {
                text: stack.depth
            }
        }
    }

}

import QtQuick 2.5
import QtQuick.Window 2.2
import QtQml 2.15

Window {
    id: root
    visible: true
    width: 900
    height: 900
    title: qsTr("Hello World")
    property variant comps : []
    color: "yellow"
    Rectangle{
        id: dd;
        x: 0; y: 0;
        width: 100; height: 100
        color: "red";

        Component.onCompleted: {
            var component = Qt.createComponent("cm.qml");
            if  (component.status == Component.Ready)
                var object = component.createObject(dd, {x: 400, y: 500, width: 200, height: 100, color :"#0fffff"});
            root.comps.push(object)
        
        
             var component2 = Qt.createComponent("comp.qml");
       
            if  (component2.status == Component.Ready)
               var object2 = component2.createObject(dd, {x: 700, y: 700, width: 200, height: 100, color: "#0fffff"});
            
            root.comps.push(object2)
    
        //    if (object.status == Component.Ready)
         //       console.log(dd,"ready");
    //        console.log(object.status,"ready");
        }
   
    }
}
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import "Generator.js" as Generator
ApplicationWindow {
    id:main
    visible: true
    width: 1366
    height: 768
    title: qsTr("Rocket Launch")



    Rectangle {
        id: sky
        z:0
        anchors { left: parent.left; top: parent.top; right: parent.right; bottom: ground.top }
        gradient: Gradient {
            GradientStop { id: gradientStopA; position: 0.0; color: "#0E1533" }
            GradientStop { id: gradientStopB; position: 1.0; color: "#437284" }
        }
    }

    Rectangle {
        id: ground
        z: 2
        height: parent.height*0.1;
        anchors { left: parent.left; right: parent.right; bottom: parent.bottom }
        gradient: Gradient {
            GradientStop { position: 0.0; color: "ForestGreen" }
            GradientStop { position: 1.0; color: "DarkGreen" }
        }
    }

    Platform{
        id:platform
        z: 4 //on the ground
        anchors.bottom:ground.top;
        anchors.horizontalCenter: ground.horizontalCenter;

    }
    Rocket{
        id:rocket1
        z:1
        //anchors.centerIn: platform;
//        anchors.bottom:ground.top-10;
//        anchors.horizontalCenter: platform.horizontalCenter;
        x:553
        y:400
    }

    LeftHolder{
        id:lholder
        z:3
        x:558
        y:570
    }

    RightHolder{
        id:rholder
        z:3
        x:647
        y:570
    }

/*
    FlameSmallL{
        id:flameSmallL
        anchors.top: rocket1.bottom
        anchors.horizontalCenter: rocket1.horizontalCenter
    }

    FlameSmallR{
        id:flameSmallR
        anchors.top: rocket1.bottom
        anchors.horizontalCenter: rocket1.horizontalCenter
    }

    FlameBig{
        id:flameBig
        anchors.top: rocket1.bottom
        anchors.horizontalCenter: rocket1.horizontalCenter
    }
*/
    Smoke_1{
        id:smoke1
        y:530
        x:605
        ScaleAnimator on scale {
            id: lesser1;
            from: 1;
            to: 0;
            duration: 100000
            running: false;
        }
    }

    Smoke_2{
        id:smoke2
        y:600
        x:660
        visible: false
        ScaleAnimator on scale {
            id: lesser2;
            from: 1;
            to: 0;
            duration: 100000
            running: false;
        }
    }

    Smoke_3{
        id:smoke3
        y:620
        x:480
        visible: false
        ScaleAnimator on scale {
            id: lesser3;
            from: 1;
            to: 0;
            duration: 100000
            running: false;
        }
    }


    Timer{
        id:timerPrePreLaunch
        interval: 2000
        running:false
        repeat:false
        onTriggered: {
            smoke2.visible=true;
        }
    }

    Timer{
        id:timerPreLaunch
        interval: 4000
        running:false
        repeat:false
        onTriggered: {
            smoke3.visible=true;
        }
    }

    Timer{
        id:timerTakeOff
        interval: 10000;
        running:false
        repeat:false
        onTriggered: {
        }
    }

    Timer{
        id:timerPostTakeOff
        interval: 12000;
        running:false
        repeat:false
        onTriggered: {
            lesser1.running=true;
        }
    }

    Timer{
        id:timerPostPostTakeOff
        interval: 17000;
        running:false
        repeat:false
        onTriggered: {
            lesser2.running=true;
            lesser3.running=true;
        }
    }

    Timer{
        id:timerLast
        interval: 26000;
        running:false
        repeat:false
        onTriggered: {

        }
    }


    Component.onCompleted: {
        timerPrePreLaunch.running=true;
        timerPreLaunch.running=true;
        timerTakeOff.running=true;
        timerPostTakeOff.running=true;
        timerPostPostTakeOff.running=true;
        timerLast.running=true;
    }


}

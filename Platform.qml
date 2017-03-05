import QtQuick 2.0
import QtQuick.Particles 2.0


Item{
    id:platform
    width: 300
    height: 40

    Canvas {
        id:canvas
        width:300
        height:40
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        ///anchors.horizontalCenter: parent.horizontalCenter
        ///anchors.bottom: parent.bottom

        property color strokeStyle:  "#000000"//black
        property color fillStyle: "#ffffff" // white
//        property int lineWidth: lineWidthCtrl.value
//        property int lineWidthIn: lineWidthCtrl.value
        property bool fill: true
        property bool stroke: true
        property real alpha: 1.0
        antialiasing: true

//        onLineWidthChanged:requestPaint();
        onFillChanged:requestPaint();
        onStrokeChanged:requestPaint();

        onPaint: {
            var ctx = canvas.getContext('2d');
            var originX = 0
            var originY = 0
            ctx.globalAlpha = canvas.alpha;
            ctx.strokeStyle = canvas.strokeStyle;
            ctx.fillStyle = canvas.fillStyle;
            ctx.lineWidth = canvas.lineWidth;
            ctx.translate(originX, originY)
            ctx.translate(-originX, -originY)
            ctx.moveTo(0,60);
            ctx.beginPath();
            ctx.lineTo(300,60);
            ctx.lineTo(265,30);
            ctx.lineTo(35,30);
            ctx.lineTo(0,60);
            ctx.closePath();
            if (canvas.fill)
                ctx.fill();
            if (canvas.stroke)
                ctx.stroke();
            ctx.restore();
        }
    }

    Timer{
        id:timerPrePreLaunch
        interval: 2000
        running:false
        repeat:false
        onTriggered: {
        }
    }

    Timer{
        id:timerPreLaunch
        interval: 6500
        running:false
        repeat:false
        onTriggered: {

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
        interval: 16000;
        running:false
        repeat:false
        onTriggered: {

        }
    }

    Timer{
        id:timerPostPostTakeOff
        interval: 22000;
        running:false
        repeat:false
        onTriggered: {

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

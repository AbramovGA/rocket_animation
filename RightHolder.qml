import QtQuick 2.7
Item {
    id:rightHolder
    width: 100
    height: 100
    transformOrigin: Item.BottomRight;

    Canvas {
        id:canvas
        width:100
        height:100
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom

        property color strokeStyle:  "#000000"//ivory
        property color fillStyle: "#8B8B83" // white
        property int lineWidth: 2
        property int lineWidthIn: 2
        property bool fill: true
        property bool stroke: true
        property real alpha: 1.0
        antialiasing: true

        onLineWidthChanged:requestPaint();
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
            ctx.moveTo(100,90);
            ctx.beginPath();
            ctx.lineTo(30,10);
            ctx.moveTo(100,90);
            ctx.lineTo(30,10);
            ctx.lineTo(8,10);
            ctx.lineTo(8,18);
            ctx.lineTo(20,18);
            ctx.lineTo(70,100);
            ctx.lineTo(100,100);
            ctx.lineTo(100,90);
            ctx.fill();
//            ctx.lineTo(80,18);
//            ctx.lineTo(70,10);
//            ctx.lineTo(95,18);
//            ctx.moveTo(95,10);
//            ctx.lineTo(80,18);
//            ctx.moveTo(70,10);
//            ctx.lineTo(30,100);
            ctx.closePath();
            ctx.stroke();
            ctx.restore();
        }
        transformOrigin: Item.TopRight;

    }

    RotationAnimator{
        id: rotate
        target: rightHolder
        from:0
        to:90
        duration: 5000
        running: false
    }

    RotationAnimator{
        id:rotateBack
        target: rightHolder
        from:90
        to:0
        duration: 5000
        running: false
    }

    Timer{
        id:timerPreTakeOff
        interval: 9000
        running: false
        repeat: false
        onTriggered: {
            rotate.running=true;
        }
    }

    Timer{
        id:timerPostTakeOff
        interval: 15000
        running: false
        repeat: false
        onTriggered: {
            rotateBack.running=true;
        }
    }

    Component.onCompleted:{
        timerPreTakeOff.running=true;
        timerPostTakeOff.running=true;
    }
}


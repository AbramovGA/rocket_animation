import QtQuick 2.0

Item {
    id: flameDot
    property int size: 8
    property int yellowPart: 0
    property var forDestroy: timerDestroy
    property int scaleIter: 0
    z: 1
    width:size
    height:size
    Canvas {
        id:canvas
        width:size
        height:size
        property color fillStyle: Qt.rgba(255, yellowPart/255., 0, 1);
        property bool fill: true
        property real alpha: 1.0
        antialiasing: true

        onFillChanged:requestPaint();

        onPaint: {
            var ctx = canvas.getContext('2d');
            var originX = 0
            var originY = 0
            ctx.globalAlpha = canvas.alpha;
            ctx.fillStyle = canvas.fillStyle;
            ctx.translate(originX, originY)
            ctx.translate(-originX, -originY)
            ctx.ellipse(0,0,size,size);
            ctx.fill();
            ctx.restore();
        }
        }

    Timer{
        id: timerFall
        interval: 100;
        running: true;
        repeat:true;
        onTriggered:{
            y+=2;
            if(scaleIter++%4==0)
                size*=0.98;
            flameDot.yellowPart+=8;
            flameDot.yellowPart%=255;
            canvas.requestPaint();

        }

    }


    Timer{
        id:timerDestroy
        running:true;
        onTriggered: flameDot.destroy();
    }

}

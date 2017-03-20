import QtQuick 2.0

Item {
    id: flameDot
    width:30
    height:30
    Canvas {
        id:canvas
        width:30
        height:30

        property color fillStyle: "#ff0000" //red goes fasta!
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
            ctx.ellipse(0,0,30,30);
            ctx.fill();
            ctx.restore();
        }
        }

    Component.onCompleted:{
            anim.running = true;
    }


    NumberAnimation on y{
        id:anim;
        to: 500; duration: 10000;
        running: false;
    }
}

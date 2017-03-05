import QtQuick 2.0

Item {
    id: flameDot
    width:30
    height:30
    z:5
    Canvas {
        id:canvas
        width:30
        height:30
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom

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
            ctx.ellipse(0,0,10,10);
            ctx.fill();
            ctx.restore();
        }
        }

    Component.onCompleted:{
            anim.running = true;
    }


    NumberAnimation on y{
        id:anim;
        to: 0; duration: 100000;
        running: false;
    }
}

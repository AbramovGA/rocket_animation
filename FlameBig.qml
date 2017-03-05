import QtQuick 2.0

Item{
    id:flame
    width: 200
    height: 300
    transform: Scale { origin.y: 0; yScale: Math.abs(0.5*Math.sin(0.7*y)+0.8)}

    Canvas {
        id:canvas
        width:200
        height:260

        Gradient {
                        GradientStop { id: gradientStopA; position: 0.0; color: "yellow" }
                        GradientStop { id: gradientStopB; position: 1.0; color: "red" }
        }

        property color strokeStyle:  "#1A1A1A"//grey
        property color fillStyle: 'red'
        property int lineWidth: 2
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
            var gradient = ctx.createLinearGradient(100, 0, 100, 200);
            gradient.addColorStop(0.0, 'rgb(255, 0, 0)');
            gradient.addColorStop(1.0, 'rgb(0, 255, 0)');
            ctx.globalAlpha = canvas.alpha;
            ctx.strokeStyle = canvas.strokeStyle;
            ctx.fillStyle = canvas.fillStyle;
            ctx.lineWidth = canvas.lineWidth;
            ctx.translate(originX, originY)
            ctx.translate(-originX, -originY)
            ctx.moveTo(75,0);
            ctx.beginPath();
            ctx.lineTo(125,0);
            ctx.quadraticCurveTo(108,25,100,200);
            ctx.quadraticCurveTo(92,25,75,0);
            ctx.stroke();
            ctx.restore();
            ctx.fill();
        }
    }
}


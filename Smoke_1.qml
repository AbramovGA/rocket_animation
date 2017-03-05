import QtQuick 2.7

Item {
  width: 100
  height: 300
  ScaleAnimator on scale {
      from: 0.5;
      to: 1;
      duration: 100000
  }

  Canvas{
      id:canvas
      width:100
      height:300

      property color strokeStyle:  "#1A1A1A"//grey
      property color fillStyle: 'lightgrey'
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
          ctx.globalAlpha = canvas.alpha;
          ctx.strokeStyle = canvas.strokeStyle;
          ctx.fillStyle = canvas.fillStyle;
          ctx.lineWidth = canvas.lineWidth;
          ctx.translate(originX, originY)
          ctx.translate(-originX, -originY)
          ctx.ellipse(20,0,60,300);
          ctx.ellipse(20,10,60,50);

          ctx.ellipse(18,50,64,70);
          ctx.ellipse(15,100,70,80);
          ctx.stroke();
          ctx.restore();
          ctx.fill();
      }
  }

}

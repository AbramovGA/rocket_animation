import QtQuick 2.7


Item {
  width: 200
  height: 100
  ScaleAnimator on scale {
      id: grow;
      from: 0;
      to: 1;
      duration: 100000
  }


  Canvas{
      id:canvas
      width:200
      height:100

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

          ctx.globalAlpha = canvas.alpha;
          ctx.strokeStyle = canvas.strokeStyle;
          ctx.fillStyle = canvas.fillStyle;
          ctx.lineWidth = canvas.lineWidth;
          ctx.ellipse(130,0,70,70);
          ctx.ellipse(100,10,80,80);
          ctx.ellipse(80,20,60,60);
          ctx.ellipse(70,30,50,50);
          ctx.stroke();
          ctx.restore();
          ctx.fill();
      }
  }

}

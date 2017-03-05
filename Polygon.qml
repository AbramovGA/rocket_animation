import QtQuick 2.0



    Canvas {
            id: root
            // canvas size

            width: 200; height: 200
            // handler to override for drawing
            onPaint: {
                // get context to draw with
                var ctx = getContext("2d")
                // setup the stroke
                ctx.lineWidth = 4
                ctx.strokeStyle = "blue"
                // setup the fill
                ctx.fillStyle = "steelblue"
                // begin a new path to draw
                ctx.beginPath()
                // top-left start point
                ctx.moveTo(50,50)
                // upper line
                ctx.lineTo(150,50)
                // right line
                ctx.lineTo(150,150)
                // bottom line
                ctx.lineTo(50,150)
                // left line through path closing
                ctx.closePath()
                // fill using fill style
                ctx.fill()
                // stroke using line width and stroke style
                ctx.stroke()
            }
        }


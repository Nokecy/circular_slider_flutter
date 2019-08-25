import 'dart:math';
import 'package:flutter/material.dart';

class BasePainter extends CustomPainter {
  void drawTable(Canvas canvas, Size size) {
    double halfWidth = size.width / 2;
    double halfHeight = size.height / 2;

    canvas.translate(halfWidth, halfWidth);
    canvas.rotate((pi / 180) * -90);

    Paint paintMain = new Paint();
    paintMain.color = Colors.blue;
    paintMain.strokeWidth = 2.5;
    paintMain.style = PaintingStyle.fill;

    Paint paintOther = new Paint();
    paintOther.color = Colors.blue;
    paintOther.strokeWidth = 1;
    paintOther.style = PaintingStyle.fill;

    for (int i = 0; i <= 180; i++) {
      canvas.save();
      canvas.rotate((pi / 180) * i);
      if (i % 30 == 0) {
        // changePaintColors(paintMain, i);
        drawLongLine(canvas, paintMain, halfWidth,
            ((180) + ((320 - 180) / 180) * i).floor().toString());
      } else if (i % 10 == 0) {
        // changePaintColors(paintMain, i);
        drawMiddleLine(canvas, paintMain, halfWidth);
      } else {
        // changePaintColors(paintOther, i);
        drawSmallLine(canvas, paintOther, halfWidth);
      }
      canvas.restore();
    }
  }

  void changePaintColors(Paint paint, int value) {
    if (value <= 20) {
      paint.color = Colors.green;
    } else if (value < 80) {
      paint.color = Colors.blue;
    } else {
      paint.color = Colors.red;
    }
  }

  void drawLongLine(
      Canvas canvas, Paint paintMain, double halfHeight, String text) {
    canvas.drawLine(new Offset(0.0, -halfHeight),
        new Offset(0.0, -halfHeight + 15), paintMain);

    TextPainter textPainter = new TextPainter();
    textPainter.textDirection = TextDirection.ltr;
    textPainter.text = new TextSpan(
        text: text,
        style: new TextStyle(
          color: paintMain.color,
          fontSize: 15.5,
        ));
    textPainter.layout();
    double textStarPositionX = -textPainter.size.width / 2;
    double textStarPositionY = -halfHeight + 19;
    textPainter.paint(canvas, new Offset(textStarPositionX, textStarPositionY));
  }

  void drawMiddleLine(Canvas canvas, Paint paintMain, double halfHeight) {
    canvas.drawLine(new Offset(0.0, -halfHeight),
        new Offset(0.0, -halfHeight + 10), paintMain);
  }

  void drawSmallLine(Canvas canvas, Paint paintOther, double halfHeight) {
    canvas.drawLine(new Offset(0.0, -halfHeight),
        new Offset(0.0, -halfHeight + 7), paintOther);
  }

  @override
  void paint(Canvas canvas, Size size) {
    drawTable(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

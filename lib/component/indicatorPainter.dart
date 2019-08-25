import 'dart:math';
import 'package:flutter/material.dart';

class IndicatorPainter extends CustomPainter {
  final double rotateAngle;
  final int value;
  static double circleWidth = 15;
  static double needleCircleMaskWidth = 10;
  static double lineWidth = 10;

  IndicatorPainter({@required this.rotateAngle, this.value});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xff3f3f3f)
      ..strokeWidth = lineWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    Paint maskPaint = Paint()
      ..color = Color(0xffffffff)
      ..style = PaintingStyle.fill;

    final lengthOfNeedle = (size.width / 4);
    canvas.drawLine(
        Offset(size.width / 2, (size.width / 2)),
        Offset(((size.width / 2) - lengthOfNeedle * cos(this.rotateAngle)),
            ((size.width / 2) - lengthOfNeedle * sin(this.rotateAngle))),
        paint);
    canvas.drawCircle(
        Offset(size.width / 2, size.width / 2), circleWidth, paint);
    canvas.drawCircle(Offset(size.width / 2, size.width / 2),
        needleCircleMaskWidth, maskPaint);

    TextPainter textPainter = new TextPainter();
    textPainter.textDirection = TextDirection.ltr;
    textPainter.text = new TextSpan(
        text: value.toString(),
        style: new TextStyle(
          color: Colors.blue,
          fontSize: 30,
        ));
    textPainter.layout();
    textPainter.paint(canvas, Offset(size.width / 2 - 15, size.width / 2 - 60));

    canvas.save();
    canvas.rotate(rotateAngle);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

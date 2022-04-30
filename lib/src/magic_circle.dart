import 'package:flutter/material.dart';
import 'dart:math';

class Circle extends CustomPainter {
  final Color color;
  final Color sliderColor;
  final Color unSelectedColor;
  final double angle;
  Circle(
      {required this.angle,
      required this.color,
      required this.sliderColor,
      required this.unSelectedColor});
  @override
  void paint(Canvas canvas, Size size) {
    var center = const Offset(0, 0);
    canvas.translate(size.width / 2, size.height / 2);
    var radius = size.width / 2;
    var circleBrush = Paint()..color = color;
    var unSelectedAreaBrush = Paint()..color = unSelectedColor;
    var sliderBrush = Paint()
      ..color = sliderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, radius, circleBrush);
    canvas.drawCircle(center, radius - 20, unSelectedAreaBrush);
    canvas.drawArc(
        Rect.fromCircle(center: const Offset(0, 0), radius: radius - 32),
        0, //radians
        -angle * pi / 180, //radians
        false,
        sliderBrush);
    canvas.drawCircle(center, radius - 45, circleBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

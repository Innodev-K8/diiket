import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  final Color color;

  CirclePainter({this.color = Colors.black});

  late final _paint = Paint()
    ..color = color
    ..strokeWidth = 2
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(
      Rect.fromLTWH(0, 0, size.width, size.height),
      _paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

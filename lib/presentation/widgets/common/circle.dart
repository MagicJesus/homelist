import 'dart:math';

import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  const Circle({
    super.key,
    required this.radius,
    required this.strokeWidth,
    this.color = Colors.amberAccent,
  });

  final double radius;
  final double strokeWidth;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromRadius(radius),
      painter: _CustomCirclePainter(
        strokeWidth: strokeWidth,
        color: color,
      ),
    );
  }
}

class _CustomCirclePainter extends CustomPainter {
  _CustomCirclePainter({
    required this.strokeWidth,
    required this.color,
  });

  final double strokeWidth;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final circleStyle = Paint();
    circleStyle.color = color;
    circleStyle.style = PaintingStyle.stroke;
    circleStyle.strokeWidth = strokeWidth;
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.height,
      ),
      3 * pi / 4,
      3 * pi / 2,
      false,
      circleStyle,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

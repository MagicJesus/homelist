import 'dart:math';

import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  const Circle({
    super.key,
    required this.radius,
    required this.strokeWidth,
  });

  final double radius;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromRadius(radius),
      painter: _CustomCirclePainter(
        strokeWidth: strokeWidth,
      ),
    );
  }
}

class _CustomCirclePainter extends CustomPainter {
  _CustomCirclePainter({
    required this.strokeWidth,
  });

  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final circleStyle = Paint();
    circleStyle.color = Colors.amberAccent.shade100;
    circleStyle.style = PaintingStyle.stroke;
    circleStyle.strokeWidth = strokeWidth;
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.height,
      ),
      0,
      2 * pi,
      false,
      circleStyle,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

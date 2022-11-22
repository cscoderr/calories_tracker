import 'dart:math' as math;

import 'package:flutter/material.dart';

class TrackerPage extends StatelessWidget {
  const TrackerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF141A1C),
        body: CustomPaint(
          painter: TrackerPainter(),
          size: MediaQuery.of(context).size,
        ));
  }
}

class TrackerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = size / 2;
    final centerOffset = Offset(center.width, center.height);
    final radius = size.width / 2.5;
    final circlePaint = Paint()
      ..color = const Color(0xFF2B3237)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 50;

    final linePaint = Paint()
      ..color = const Color(0xFF2B3237)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final arcPaint = Paint()
      ..color = const Color(0xFFB0F338)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 50;

    canvas.drawArc(
      Rect.fromCircle(
        center: centerOffset,
        radius: radius,
      ),
      -180.radians,
      180.radians,
      false,
      circlePaint,
    );

    //180

    canvas.drawArc(
      Rect.fromCircle(
        center: centerOffset,
        radius: radius,
      ),
      -180.radians,
      90.radians,
      false,
      arcPaint,
    );

    const centerArcRadius = 50;
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(center.width, center.height),
        radius: radius - centerArcRadius,
      ),
      -180.radians,
      180.radians,
      false,
      linePaint,
    );

    canvas.drawCircle(
      centerOffset,
      25,
      Paint()..color = const Color(0xFF2B3237),
    );

    const spacingFromCenterArc = 10;
    final path = Path();
    path.moveTo(center.width - 10, center.height);
    path.lineTo(
      center.width - 10,
      center.height - radius + centerArcRadius + spacingFromCenterArc,
    );
    path.lineTo(
      center.width - 5,
      center.height - radius + centerArcRadius + spacingFromCenterArc,
    );
    path.lineTo(center.width + 10, center.height);

    path.close();
    canvas.drawPath(
      path,
      Paint()
        ..color = Colors.white
        ..strokeCap = StrokeCap.round,
    );

    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(
            center.width - 7.5, center.height - radius + centerArcRadius + 10),
        radius: 2,
      ),
      -180.radians,
      180.radians,
      false,
      Paint()..color = Colors.white,
    );

    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(center.width, center.height),
        radius: 10,
      ),
      0,
      180.radians,
      false,
      Paint()..color = Colors.white,
    );

    canvas.drawCircle(
      centerOffset,
      5,
      Paint()..color = Colors.black,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

extension NumX on num {
  double get degrees => (this * 180.0) / math.pi;
  double get radians => (this * math.pi) / 180;
}

Offset toPolar(Offset center, double radians, double radius) {
  return center +
      Offset(radius * math.cos(radians), radius * math.sin(radians));
}

import 'dart:math' as math;
import 'package:flutter/material.dart';

class Painter extends CustomPainter {
  final List<int> shells;
  Painter({
    required this.shells,
  });

  static const space = 20.0;

  final locations = [
    0,
    math.pi,
    math.pi / 2,
    3 * math.pi / 2,
    math.pi / 4,
    5 * math.pi / 4,
    3 * math.pi / 4,
    7 * math.pi / 4,
    math.pi / 3,
    4 * math.pi / 3,
    2 * math.pi / 3,
    5 * math.pi / 3,
    5 * math.pi / 6,
    11 * math.pi / 6,
    math.pi / 6,
    7 * math.pi / 6,
    math.pi / 12,
    17 * math.pi / 12,
    11 * math.pi / 12,
    19 * math.pi / 12,
    23 * math.pi / 12,
    7 * math.pi / 12,
    13 * math.pi / 12,
    5 * math.pi / 12,
    5 * math.pi / 4 + 30,
    19 * math.pi / 12 + 30,
    19 * math.pi / 12 + 30,
    5 * math.pi / 6 + 30,
    math.pi / 12 + 30,
    7 * math.pi / 12 + 30,
    math.pi / 3 + 30,
    math.pi / 4 + 30,
  ];

  void drawProtonsAndNeutrons(Canvas canvas, Size size, Paint paint) {
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2), radius: 8),
      0,
      100,
      false,
      paint,
    );
  }

  void drawElectrons(Canvas canvas, Size size, Paint paint) {
    var distance = 1;
    for (var shell in shells) {
      for (var i = 0; i < shell; i++) {
        final x =
            (size.width / 2) + ((distance * space) * math.cos((locations[i])));
        final y =
            (size.height / 2) + ((distance * space) * math.sin(locations[i]));
        canvas.drawArc(
          Rect.fromCircle(
            center: Offset(x, y),
            radius: 4,
          ),
          0,
          100,
          false,
          paint,
        );
      }
      distance += 1;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 4.0
      ..color = Colors.indigo;

    drawProtonsAndNeutrons(canvas, size, paint);

    drawElectrons(canvas, size, paint);

    paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = Colors.indigo;

    var distance = 1;
    for (var i = 0; i < shells.length; i++) {
      canvas.drawArc(
        Rect.fromCircle(
          center: Offset((size.width / 2), (size.height / 2)),
          radius: space * distance,
        ),
        0,
        100,
        false,
        paint,
      );
      distance += 1;
    }
  }

  @override
  bool shouldRepaint(Painter oldDelegate) => false;
}

class ElementSheels extends StatelessWidget {
  final List<int>? shells;
  const ElementSheels({
    Key? key,
    required this.shells,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 350,
      alignment: Alignment.center,
      child: CustomPaint(
        painter: Painter(shells: shells ?? []),
      ),
    );
  }
}

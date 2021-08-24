import 'package:flutter/material.dart';

class LineChart extends StatelessWidget {
  const LineChart({
    Key? key,
    this.minValue = 0,
    this.maxValue = 100,
    this.y = 200,
    this.x = 200,
  }) : super(key: key);

  final double minValue;
  final double maxValue;
  final double y;
  final double x;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: LineChartPainter(
          minValue: minValue,
          maxValue: maxValue,
          x: x,
          y: y,
        ),
      ),
    );
  }
}

class LineChartPainter extends CustomPainter {
  const LineChartPainter({
    required this.minValue,
    required this.maxValue,
    required this.y,
    required this.x,
  });

  final double minValue;
  final double maxValue;
  final double y;
  final double x;

  void _drawAxis(Canvas canvas, Paint paint) {
    // x轴
    canvas.drawLine(Offset(20, y), Offset(20 + x, y), paint);
    // y轴
    canvas.drawLine(Offset(20, 20), Offset(20, y), paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paintAxis = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    _drawAxis(canvas, paintAxis);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

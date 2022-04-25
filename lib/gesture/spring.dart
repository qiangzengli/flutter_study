import 'package:flutter/material.dart';

class SpringPage extends StatefulWidget {
  const SpringPage({Key? key}) : super(key: key);

  @override
  _SpringPageState createState() => _SpringPageState();
}

class _SpringPageState extends State<SpringPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SpringWidget(),
        ),
      ),
    );
  }
}

class SpringWidget extends StatefulWidget {
  const SpringWidget({Key? key}) : super(key: key);

  @override
  _SpringWidgetState createState() => _SpringWidgetState();
}

class _SpringWidgetState extends State<SpringWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.grey.withAlpha(11),
      child: CustomPaint(
        painter: SpringPainter(
          height: 100,
        ),
      ),
    );
  }
}

class SpringPainter extends CustomPainter {
  final double _kSpringWidth = 30;
  final int count;
  final double height;

  SpringPainter({this.count = 20, required this.height});

  Paint _paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2 + _kSpringWidth / 2, size.height);
    Path springPath = Path();
    springPath.relativeLineTo(-_kSpringWidth, 0);
    double space = height / (count - 1);
    for (int i = 1; i < count; i++) {
      if (i % 2 == 1) {
        springPath.relativeLineTo(_kSpringWidth, -space);
      } else {
        springPath.relativeLineTo(-_kSpringWidth, -space);
      }
    }

    springPath.relativeLineTo(count.isOdd ? _kSpringWidth : -_kSpringWidth, 0);
    canvas.drawPath(springPath, _paint);
  }

  @override
  bool shouldRepaint(covariant SpringPainter oldDelegate) {
    return oldDelegate.count != count || oldDelegate.height != height;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Paper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: PaperPainter(),
      ),
    );
  }
}

class PaperPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 创建画笔
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..color = Colors.blue
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.fill;
    //绘制圆
    canvas.drawCircle(Offset(100, 100), 10, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

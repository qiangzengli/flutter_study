import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomSingleChildWidget extends SingleChildRenderObjectWidget {
  const CustomSingleChildWidget({
    Key? key,
    this.color = Colors.red,
  }) : super(key: key);
  final Color color;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCustomSingleChildWidget(color: color);
  }
}

class RenderCustomSingleChildWidget extends RenderBox
    with RenderObjectWithChildMixin<RenderBox> {
  RenderCustomSingleChildWidget({required this.color});

  final Color color;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) {
      Paint _paint = Paint();
      final canvas = context.canvas;
      Rect rect = Rect.fromLTWH(0, 32.5, 100, 100);
      // Rect.fromCenter(center: Offset(100, 100), width: 100, height: 100);
      _paint.color = color;
      canvas.drawRect(rect, _paint);
    } else {
      context.paintChild(child!, offset);
    }
  }

  @override
  void performLayout() {
    final BoxConstraints constraints = this.constraints;
    if (child == null) {
      size = constraints.biggest;
      return;
    }
    child!.layout(constraints, parentUsesSize: true);
    final BoxParentData childParentData = child!.parentData as BoxParentData;
    size = child!.size;
    childParentData.offset = Offset.zero;
  }
}

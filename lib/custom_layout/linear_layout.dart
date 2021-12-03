import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LinearLayout extends MultiChildRenderObjectWidget {
  LinearLayout({
    Key? key,
    required List<Widget> children,
  }) : super(key: key, children: children);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return LinearLayoutRenderObject();
  }
}

class LinearLayoutRenderObject extends RenderBox {
  @override
  void performLayout() {
    super.performLayout();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);

  }
}

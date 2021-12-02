import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedBuilderPage extends StatefulWidget {
  const AnimatedBuilderPage({Key? key}) : super(key: key);

  @override
  _AnimatedBuilderPageState createState() => _AnimatedBuilderPageState();
}

class _AnimatedBuilderPageState extends State<AnimatedBuilderPage>
    with TickerProviderStateMixin {
  late AnimationController _controller = AnimationController(vsync: this)
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    });
  late CurvedAnimation _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInExpo,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (_, __) => FlutterLogo(),
        ),
      ),
    );
  }
}

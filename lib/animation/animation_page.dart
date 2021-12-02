import 'package:flutter/material.dart';
import 'package:flutter_study/animation/animated_builder_page.dart';

final routes = {
  'animated_builder': (_) => AnimatedBuilderPage(),
};

class AnimationPage extends StatelessWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar()
    );
  }
}

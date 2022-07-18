import 'package:flutter/material.dart';

class AnimatedWidgetPage1 extends StatelessWidget {
  const AnimatedWidgetPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
          child: const Text('Go!'),
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // 新页面从右向左滑入
          // const begin = Offset(1.0, 0.0);
          // const end = Offset(0.0, 0.0);
          // 新页面从左向右滑入
          const begin = Offset(-1.0, 0.0);
          const end = Offset(0.0, 0.0);

          //新页面从下向上滑入
          // const begin = Offset(0.0, 1.0);
          // const end = Offset(0.0, 0.0);

          // 新页面从上向下滑入
          // const begin = Offset(0.0, -1.0);
          // const end = Offset(0.0, 0.0);

          //   使用chain结合两个tween
          var curve = Curves.bounceInOut;
          var curveTween = CurveTween(curve: curve);

          var tween = Tween(begin: begin, end: end).chain(curveTween);

          // final tween = Tween(begin: begin, end: end);

          final offsetAnimation = animation.drive(tween);

          // SlideTransition 实现平移动画
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        });
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: const Center(
        child: Text('Page 2'),
      ),
    );
  }
}

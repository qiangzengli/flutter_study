import 'package:flutter/material.dart';

class Key01 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Key01State();
}

class Key01State extends State<Key01> {
  IconData iconData = Icons.clear;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('使用key区分子组件'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (iconData == Icons.android_outlined) {
              iconData = Icons.phone_iphone;
            } else {
              iconData = Icons.android_outlined;
            }
          });
        },
        //使用AnimatedSwitcher展示动画
        child: AnimatedSwitcher(
          transitionBuilder: (child, anim) {
            return RotationTransition(
              turns: anim,
              child: child,
            );
          },
          duration: Duration(milliseconds: 300),
          child: Icon(
            iconData,
            key: ValueKey(iconData),
          ),
        ),
      ),
    );
  }
}

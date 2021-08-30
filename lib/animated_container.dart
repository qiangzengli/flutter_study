import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({Key? key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _height = 200;
  Color _color = Colors.yellow;

  void changeState() {
    _height = _height == 50 ? 200 : 50;
    _color = _color == Colors.blue ? Colors.yellow : Colors.blue;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          AnimatedContainer(
            color: _color,
            duration: Duration(seconds: 1),
            curve: Curves.easeInCirc,
            width: _height,
            height: _height,
            onEnd: () {
              print('动画结束');
            },
          ),
          OutlinedButton(
            onPressed: changeState,
            child: Text('改变状态'),
          ),
        ],
      ),
    ));
  }
}

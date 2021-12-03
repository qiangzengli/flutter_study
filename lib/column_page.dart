import 'package:flutter/material.dart';

class ColumnPage extends StatefulWidget {
  const ColumnPage({Key? key}) : super(key: key);

  @override
  _ColumnPageState createState() => _ColumnPageState();
}

class _ColumnPageState extends State<ColumnPage> {
  List<Widget> list() {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < 10; i++) {
      list.add(Container(
        child: Text('第$i条'),
        padding: EdgeInsets.all(10),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: ListView(
            children: <Widget>[TextField(), ...list()],
          ),
        ),
      ),
    );
  }
}

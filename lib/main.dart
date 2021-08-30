import 'package:flutter/material.dart';
import 'package:flutter_study/animated_container.dart';

import 'absorb_pointer_page.dart';

final routes = {
  '/absorb_pointer': (_) => AbsorbPointerPage(),
  '/animated_container': (_) => AnimatedContainerPage(),
};

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      title: 'Widgets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: routes.keys
              .map(
                (e) => ListTile(
                  title: Text(e),
                  onTap: () {
                    Navigator.of(context).pushNamed(e);
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

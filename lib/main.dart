import 'package:flutter/material.dart';
import 'package:flutter_study/animated_container.dart';
import 'package:flutter_study/animation/animation_controller_page.dart';
import 'package:flutter_study/column_page.dart';
import 'package:flutter_study/custom_single_child_widget/custom_single_child_page.dart';
import 'package:flutter_study/gesture/spring.dart';
import 'package:flutter_study/stream_scroll_controller_page.dart';

import 'absorb_pointer_page.dart';
import 'lifecycle_page.dart';

final routes = {
  '/absorb_pointer': (_) => AbsorbPointerPage(),
  '/animated_container': (_) => AnimatedContainerPage(),
  '/animation_controller': (_) => AnimationControllerPage(),
  '/spring_page': (_) => SpringPage(),
  '/lifecycle_page': (_) => LifecyclePage(),
  '/stream_scroll_page': (_) => StreamScrollControllerPage(),
  '/column_page': (_) => ColumnPage(),
  '/custom_single_child_page': (_) => CustomSingleChildPage(),
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

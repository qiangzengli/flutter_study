import 'dart:async';
import 'dart:ui' as ui;
import 'dart:math' as math;
import 'package:flutter/material.dart';

class StreamScrollControllerPage extends StatefulWidget {
  const StreamScrollControllerPage({Key? key}) : super(key: key);

  @override
  _StreamScrollControllerPageState createState() =>
      _StreamScrollControllerPageState();
}

class _StreamScrollControllerPageState
    extends State<StreamScrollControllerPage> {
  final ScrollController _scrollController = ScrollController();
  final StreamController<double> _scrollStream =
      StreamController<double>.broadcast();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _scrollStream.add(_scrollController.offset);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollStream.close();
    super.dispose();
  }

  List<Widget> list() {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < 100; i++) {
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
        child: Stack(
          children: [
            ListView(
              controller: _scrollController,
              children: list(),
            ),
            Positioned.fill(
              bottom: null,
              child: StreamBuilder<double>(
                initialData: 0.0,
                stream: _scrollStream.stream,
                builder: (_, snapshot) {
                  print(snapshot.data!);
                  return AppBar(
                    title: Text('Stream'),
                    backgroundColor: Colors.blue.withOpacity((snapshot.data! /
                            MediaQueryData.fromWindow(ui.window).size.height)
                        .lessThanOne),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension NumExtension<T extends num> on T {
  T get lessThanOne => math.min<T>((this is int ? 1 : 1.0) as T, this);

  T get lessThanZero => math.min<T>((this is int ? 0 : 0.0) as T, this);

  T get moreThanOne => math.max<T>((this is int ? 1 : 1.0) as T, this);

  T get moreThanZero => math.max<T>((this is int ? 0 : 0.0) as T, this);

  T get betweenZeroAndOne => lessThanOne.moreThanZero;

  /// 根据位数四舍五入
  T roundAsFixed(int size) => num.parse(toStringAsFixed(size)) as T;
}

import 'package:flutter/material.dart';

class LifecyclePage extends StatefulWidget {
  const LifecyclePage({Key? key}) : super(key: key);

  @override
  _LifecyclePageState createState() {
    print('invoke createState()');
    return _LifecyclePageState();
  }

  @override
  StatefulElement createElement() {
    // TODO: implement createElement
    print('invoke createElement()');
    return super.createElement();
  }
}

class _LifecyclePageState extends State<LifecyclePage> {
  int num = 0;
  ValueNotifier<int> numValueNotifier = ValueNotifier(0);

  @override
  void didUpdateWidget(covariant LifecyclePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('invoke didUpdateWidget()');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('invoke didChangeDependencies()');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('invoke dispose()');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('invoke initState()');
  }

  @override
  void activate() {
    // TODO: implement activate
    super.activate();
    print('invoke activate()');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('invoke deactivate()');
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print('invoke reassemble() ');
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print('invoke setState()');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('setState 刷新$num'),
            ValueListenableBuilder(
                valueListenable: numValueNotifier,
                builder: (_, int num, __) {
                  print('invoke notifier build()');
                  return Text('ValueNotifier 刷新$num');
                }),
            ButtonBar(
              children: [
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      num++;
                    });
                  },
                  child: Text('setState'),
                ),
                MaterialButton(
                  onPressed: () {
                    numValueNotifier.value = ++numValueNotifier.value;
                  },
                  child: Text('ValueNotifier'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

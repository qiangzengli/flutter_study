import 'package:flutter/material.dart';

class AbsorbPointerPage extends StatelessWidget {
  const AbsorbPointerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            children: [
              AbsorbPointer(
                // 默认为true
                absorbing: true, // 逐级向下传递
                child: OutlinedButton(
                  child: GestureDetector(
                    child: Text('忽略点击按钮'),
                    onTap: () {
                      print('忽略按钮内部Text点击');
                    },
                  ),
                  onPressed: () {
                    print('忽略点击按钮');
                  },
                ),
              ),
              OutlinedButton(
                child: Text('常规按钮'),
                onPressed: () {
                  print('点击常规按钮');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

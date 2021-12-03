import 'package:flutter/material.dart';
import 'package:flutter_study/custom_single_child_widget/custom_single_child_widget.dart';

class CustomSingleChildPage extends StatefulWidget {
  const CustomSingleChildPage({Key? key}) : super(key: key);

  @override
  _CustomSingleChildPageState createState() => _CustomSingleChildPageState();
}

class _CustomSingleChildPageState extends State<CustomSingleChildPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: CustomSingleChildWidget(
          color: Colors.blue,
        ),
      ),
    ));
  }
}

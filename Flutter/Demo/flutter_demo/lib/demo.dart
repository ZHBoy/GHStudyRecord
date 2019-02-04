import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('布局练习'),
      ),
      body: Container(
        child: Text('1asssssss'),
      ),
    );
  }
}
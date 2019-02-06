import 'package:flutter/material.dart';
import './demo.dart';
import './tabBar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterDemo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: tabBar(),
    );
  }
}

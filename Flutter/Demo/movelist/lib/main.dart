import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {// 每个组件必须要有这个函数
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('电影列表001'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),)
        ],
      ),
      drawer: Drawer(),
    );
  }
}
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
        padding: EdgeInsets.all(10),
        child: Column(
                 
          children: <Widget>[
            
            Container(
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  
                  Text('哈哈'),
                  Text('哈阿斯达大哈'),

                ],
              ),
            ),
            Container(
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
               crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('1222'),
                  Text('2'),
                  Text('3'),
                ],
              ),
            ),
            Text('1'),
            Text('2'),
            Text('3'),
          ],
        )
      ),
    );
  }
}
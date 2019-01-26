import 'package:flutter/material.dart';

void main () =>runApp(MyApp());

class MyApp extends StatelessWidget {

   @override
  Widget build(BuildContext content) {
    return  MaterialApp (
      title:"Test widget",
      home: Scaffold(
        body: Center(
          child: Container (
             child:new Text('GHome',style: TextStyle(fontSize: 40.0),),
            alignment: Alignment.centerLeft,
            width: 500,
            height: 60,
            color: Colors.red,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
decoration:new BoxDecoration(
              gradient:const LinearGradient(
                colors:[Colors.lightBlue,Colors.greenAccent,Colors.purple]
              ),
              border:Border.all(width:2.0,color:Colors.red)
            ),
        ),
      ),
    );
  }
}
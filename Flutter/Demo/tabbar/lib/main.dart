import 'package:flutter/material.dart';
import './bottom_navigation_widget.dart';

void main() => runApp(new Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp (
     title: 'nav abr',
     theme: ThemeData.light(),
     home: BottomNavWidget(),
  
   );
  }
}
import 'package:flutter/material.dart';
import 'page/home_screen.dart';

class BottomNavWidget extends StatefulWidget {
  _BottomNavWidgetState createState() => _BottomNavWidgetState();
}
class _BottomNavWidgetState extends State<BottomNavWidget> {

  final _BottomNavgationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> list = List();
  @override
 void initState(){
      list
      ..add(HomeScreen())
    ..add(HomeScreen())

      ..add(HomeScreen())

      ..add(HomeScreen());
  super.initState();
 }
  @override
  
  Widget build(BuildContext context) {
   
      return Scaffold (
        body: list[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem (
              icon: Icon(
                Icons.home,
                color: _BottomNavgationColor,
              ),
              title: Text(
                'home',
                style: TextStyle(color: _BottomNavgationColor),
              )
            ),
              BottomNavigationBarItem (
              icon: Icon(
                Icons.message,
                color: _BottomNavgationColor,
              ),
              title: Text(
                'fine',
                style: TextStyle(color: _BottomNavgationColor),
              )
            ),
            BottomNavigationBarItem (
              icon: Icon(
                Icons.home,
                color: _BottomNavgationColor,
              ),
              title: Text(
                'me',
                style: TextStyle(color: _BottomNavgationColor),
              )
            ),
             BottomNavigationBarItem (
              icon: Icon(
                Icons.home,
                color: _BottomNavgationColor,
              ),
              title: Text(
                'calte',
                style: TextStyle(color: _BottomNavgationColor),
              )
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (int index){
              setState(() {
                              _currentIndex = index;
                            });
          }
        ),
      );
  }
}
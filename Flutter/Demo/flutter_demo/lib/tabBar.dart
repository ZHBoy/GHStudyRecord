import 'package:flutter/material.dart';
import './app/Home/home.dart';
import './app/idae.dart';
import './app/message.dart';
import './app/school.dart';
import './app/me.dart';
import 'package:flutter/cupertino.dart';


class tabBar extends StatefulWidget {
  _tabBarState createState() => _tabBarState();
}

class _tabBarState extends State<tabBar> {

  int _tabIndex = 0;
    List _tabImages = [
      Icon(Icons.view_list, size: 25.0, color: Colors.grey,),
      Icon(Icons.touch_app, size: 25.0, color: Colors.grey,),
      Icon(Icons.school, size: 25.0, color: Colors.grey,),
      Icon(Icons.notifications, size: 25.0, color: Colors.grey,),
      Icon(Icons.person, size: 25.0, color: Colors.grey,),
    ];

    List _tabSelectedImages = [
    Icon(Icons.view_list, size: 25.0, color: Colors.blue,),
    Icon(Icons.touch_app, size: 25.0, color: Colors.blue,),
    Icon(Icons.school, size: 25.0, color: Colors.blue,),
    Icon(Icons.notifications, size: 25.0, color: Colors.blue,),
    Icon(Icons.person, size: 25.0, color: Colors.blue,),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: <Widget>[
            HomePage(),
            IdeaPage(),
            SchoolPage(),
            MessagePage(),
            MePage(),
        ],
        index: _tabIndex,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: Colors.blue,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: getTabIcon(0), title: Text('首页')),
          BottomNavigationBarItem(icon: getTabIcon(1), title: Text('想法')),
          BottomNavigationBarItem(icon: getTabIcon(2), title: Text('大学')),
          BottomNavigationBarItem(icon: getTabIcon(3), title: Text('消息')),
          BottomNavigationBarItem(icon: getTabIcon(4), title: Text('我')),
        ],
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }
  Icon getTabIcon(int index){
    if (index == _tabIndex) {
       return _tabSelectedImages[index];
    } else {
      return _tabImages[index];
    }
  }
}
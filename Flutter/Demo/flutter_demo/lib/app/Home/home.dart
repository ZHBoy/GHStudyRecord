import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  TabController _tabController;
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
  }

  @override
  void dispose() {
    ///页面销毁时，销毁控制器
    _tabController.dispose();
    super.dispose();
  }
  
  final loginButton = FlatButton.icon(
      onPressed: () {},
      icon: Icon(
        Icons.mode_edit,
        size: 20.0,
        color: Colors.white,
      ),
      label: Text(
        "提问",
        style: TextStyle(color: Colors.white, fontSize: 18.0),
      ));
    
  Widget barSearch(){
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(0),
            child: new FlatButton.icon(
              color: Colors.white,
              onPressed: (){},
              icon: Icon(
                Icons.search,
                size: 18.0,
                color: Colors.grey,
              ),
              label: Text('搜索',style: TextStyle(color: Colors.grey ,fontSize: 16),),
            ),
          ),
        ),
        loginButton
      ],
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: barSearch(),
        bottom: TabBar(
           controller: _tabController,

          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(text: '关注',),
            Tab(text: '推荐',),
            Tab(text: '热情',),
            Tab(text: '视频',),

          ],
        ),
      ),
       body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
            Text('1'),
        ],
      ),
    );
  }
}
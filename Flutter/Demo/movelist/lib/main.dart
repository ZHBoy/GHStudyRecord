import 'package:flutter/material.dart';
import './list.dart';

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
    return DefaultTabController(
      length: 3 ,child: Scaffold(
        appBar: AppBar(
        title: Text('电影列表'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),)
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
      
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike80%2C5%2C5%2C80%2C26/sign=c7f9d0637e0e0cf3b4fa46a96b2f997a/d058ccbf6c81800a4e73f47fbd3533fa828b4728.jpg')),
              ),
              accountEmail:Text('1') ,
              accountName: Text('2'),
              currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage('https://gss0.bdstatic.com/-4o3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike116%2C5%2C5%2C116%2C38/sign=2e0e73a407d162d991e36a4e70b6c289/9922720e0cf3d7ca57cd0216ff1fbe096b63a992.jpg'),),
            ),
            ListTile(title: Text('个人说明'),trailing: Icon(Icons.feedback),),
            Divider(),
        ],),
      ),
      body: TabBarView(children: <Widget>[
        Moviewlist(mt: 'in_theaters',),
        Moviewlist(mt: 'coming_soon',),
        Moviewlist(mt: 'top250',),

      ],),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.orange,
          
        ),
        height: 88,
          child: TabBar(
            labelStyle: TextStyle(height: 0,fontSize: 10),
                 tabs: <Widget>[
                  Tab(icon: Icon(Icons.movie_filter),text: '电影1',),
                  Tab(icon: Icon(Icons.movie_filter),text: '电影2',),
                  Tab(icon: Icon(Icons.movie_filter),text: '电影3',),

             ],
  
          ),
       ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import './homeListItem.dart';
import './requst.dart';
import 'package:dio/dio.dart';

Dio dio = new Dio();
class HomeListView extends StatefulWidget {
  _HomeListViewState createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {
  List modules = [];
  int page = 1;
  ScrollController _scrollController = new ScrollController();
  bool isPerformingRequest = false;
  fetchData() async {
      var response = await dio.get('http://www.liulongbin.top:3005/api/v2/movie/$北京?start=$offset&count=$pagesize');
    print(response);

  }

  @override
  void initState(){
    super.initState();
    fetchData();
  }
  
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context,int index){
          return HomeListItem();
        },
    );
      
  }
}
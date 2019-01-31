import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

Dio dio = new Dio();

class Moviewlist extends StatefulWidget {
  Moviewlist({Key key,this.mt}):super(key: key);
  final String mt;
  _MoviewlistState createState() => _MoviewlistState();
}

class _MoviewlistState extends State<Moviewlist> {

  int page = 1;
  int pagesize = 10;
  var mlist = [];
  var total = 0;

  @override
  void initState(){
    super.initState();
    getMoviewList();
  }

  Widget build(BuildContext context) {
    return Text(
       '111' + widget.mt,
    );
  }

  getMoviewList()async{

    int offset = (page - 1) * pagesize;
    var response = await dio.get('http://www.liulongbin.top:3005/api/v2/movie/coming_soon?start=0&count=10');
    var result = response.data;

    print(result);
  }
}




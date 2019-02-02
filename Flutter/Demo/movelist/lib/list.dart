import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import './details.dart';

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
  var images = [];

  @override
  void initState(){
    super.initState();
    getMoviewList();
  }

  Widget build(BuildContext context) {
     int count = mlist.length;
     return ListView.builder(
       itemCount: count,
       itemBuilder: (BuildContext context, int i){
          var mitem = mlist[i];
          String url = 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1549123326591&di=90f329a09d24ef5dffc5c9225f44b6fe&imgtype=0&src=http%3A%2F%2Fimg0.ph.126.net%2FtvpBly3va7alxcVrVh29Bg%3D%3D%2F6631447097213070177.jpg';
          String title = mitem['title'];
          String year = mitem['year'];

          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx) {
                return new MovieDetails();
              }));
            },
            child: Container(

            decoration: BoxDecoration(color: Colors.white,border: Border(top: BorderSide(color: Colors.black12))) ,
            child: Row(children: <Widget>[
            Image.network(url,width: 130, height: 180,fit: BoxFit.cover,),
            Container(
              height: 200,

              padding: EdgeInsets.all(10),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              
                Text('电影名称' + title),
                Text('上映年份' + year),
                Text('电影类型 + ${mitem['genres'].join(',')}'),
                Text('主要演员+ ${mitem['genres'].join(',')}'),

            ],
            )

            )
       
          ],
         ),
          ),
          );
       }
     );
  }

  getMoviewList()async{

    int offset = (page - 1) * pagesize;
    String string = widget.mt;
    var response = await dio.get('http://www.liulongbin.top:3005/api/v2/movie/$string?start=$offset&count=$pagesize');
    var result = response.data;

    setState(() {
      mlist = result['subjects'];
      total = result['total'];

    });
  }
}




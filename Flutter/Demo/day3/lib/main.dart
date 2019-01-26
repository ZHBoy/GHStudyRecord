import 'package:flutter/material.dart';
import './WeatherData.dart';


void main () => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context) {
      return MaterialApp(
        title: "Text widge",
        home: Scaffold(
           body: new Stack(
                 fit: StackFit.expand,
                 children: <Widget>[
                      new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                                new Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.only(top: 40.0),
                                    child: new Text(
                                      "广州市",
                                      textAlign: TextAlign.center,
                                      style: new TextStyle(
                                        color: Colors.red,
                                        fontSize: 30.0,
                                      ),
                                    ),
                                ),
                                new Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.only(top: 40.0),
                                    child: new Text(
                                      "佳木斯",
                                      textAlign: TextAlign.center,
                                      style: new TextStyle(
                                        color: Colors.red,
                                        fontSize: 30.0,
                                      ),
                                    ),
                                )
                          ],
                      )
                 ],
           ),
        ),
      );
  }
}


class WeatherData{
  String cond; //天气
  String tmp; //温度
  String hum; //湿度

  WeatherData({this.cond, this.tmp, this.hum});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      cond: json['HeWeather6'][0]['now']['cond_txt'],
      tmp: json['HeWeather6'][0]['now']['tmp']+"°",
      hum: "湿度  "+json['HeWeather6'][0]['now']['hum']+"%",
    );
  }

  factory WeatherData.empty() {
    return WeatherData(
      cond: "",
      tmp: "",
      hum: "",
    );
  }
}



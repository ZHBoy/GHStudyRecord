# helloWorld
--

#### 第一个helloWorld

新建一个`Flutter`项目命名为Day2

打开项目,选择view菜单下的Command Palette...

![image.png](https://upload-images.jianshu.io/upload_images/1419035-2d84429cb8596b28.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/210)

在顶部搜索框输入`fluter`,选择Fluter new Project

![image.png](https://upload-images.jianshu.io/upload_images/1419035-f541415693213033.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


在输入项目名称,这里flutter项目名字要以小写字母命名,接下来选择工程的目录

![image.png](https://upload-images.jianshu.io/upload_images/1419035-80d75cb4d1d3e853.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


项目界面

![image.png](https://upload-images.jianshu.io/upload_images/1419035-b9531742e35c0e70.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

代码含义

```
import 'package:flutter/material.dart';
//主函数（入口函数），下面我会简单说说Dart的函数
void main() =>runApp(MyApp());
// 声明MyApp类
class MyApp extends StatelessWidget{
  //重写build方法
  @override
  Widget build(BuildContext context){
    //返回一个Material风格的组件
   return MaterialApp(
      title:'Welcome to Flutteraa',
      home:Scaffold(
        //创建一个Bar，并添加文本
        appBar:AppBar(
          title:Text('Welcome to Flutter'),
        ),
        //在主体的中间区域，添加一个hello world 的文本
        body:Center(
          child:Text('Hello World'),
        ),
      ),
    );
  }
}
```

运行代码,这时候会自动启动模拟器

![image.png](https://upload-images.jianshu.io/upload_images/1419035-ec82b4c08103fb82.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



![image.png](https://upload-images.jianshu.io/upload_images/1419035-2a60f0c5495a9840.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
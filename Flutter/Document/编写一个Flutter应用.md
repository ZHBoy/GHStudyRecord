# 编写一个Flutter应用

#### 创建一个flutter空的项目

'注意:创建项目的名称必须是小写'

在命令行模式下输入 flutter create firstapp

![image.png](https://upload-images.jianshu.io/upload_images/1419035-9888c26b022c84dd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

进入项目 cd firstapp

执行命令 flutter run 
![image.png](https://upload-images.jianshu.io/upload_images/1419035-3700d9ad307f864e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

'注意:运行之前需要选择一个模拟器或者真机' 建议提前把模拟器打开或者真机

![image.png](https://upload-images.jianshu.io/upload_images/1419035-c96c5a09bbe6cb68.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

打开main.dart文件 删除原来代码,用以下代码替换

```
	import 'package:flutter/material.dart';
	
	void main() => runApp(new MyApp());
	
	class MyApp extends StatelessWidget {
	  @override
	  Widget build(BuildContext context) {
	    return new MaterialApp(
	      title: 'Welcome to Flutter',
	      home: new Scaffold(
	        appBar: new AppBar(
	          title: new Text('firstApp'),
	        ),
	        body: new Center(
	          child: new Text('喝大力出奇迹),
	        ),
	      ),
	    );
	  }
	}
```
运行效果
![image.png](https://upload-images.jianshu.io/upload_images/1419035-2206726e291ffb9d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

引用package 

打开pubspec,yaml文件
在第18行加入如下代码,注意格式一定要对齐

```
  english_words: ^3.1.0

```
在main.dart引入package

```
import 'package:english_words/english_words.dart';

```

运行

```
	[firstapp] flutter packages get
	Running "flutter packages get" in firstapp...                    1.4s
	exit code 0

```

试着调用english_words生成随机单词

完整代码

```
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          //child: new Text('Hello World'),
          child: new Text(wordPair.asPascalCase),
        ),
      ),
    );
  }
}

```

Stateless widgets 是不可变的
Stateful widgets 持有的状态可能在widget生命周期中发生变化. 实现一个 stateful widget 至少需要两个类












## 学习记录

**目录**

[01环境搭建](#01环境搭建)

[02搭建项目](#02搭建项目)

[03底部导航条制作](#03底部导航条制作)

[04底部导航栏切换效果](#04底部导航栏切换效果)

[05Dio基础_引入和简单的Get请求](#05Dio基础_引入和简单的Get请求)

[06.Dio基础_Get请求和动态组件协作](#06.Dio基础_Get请求和动态组件协作)

--- 

[常用的快捷键](#常用的快捷键)

[代码规范](#代码规范)

[资源](#资源)

[Dart语法](#Dart语法)

[Widget](#Widget)

* [TextWidget](#TextWidget)

* [Container](#Container)


### 01环境搭建

>首先感谢`技术胖`大神视频博客讲解,笔记是根据技术胖博客和视频整理而成,你也可以直接浏览`技术胖`[技术博客](http://jspang.com/post/flutter1.html)学习,再次感谢!

此教程为mac环境搭建

[windows搭建环境教程点此处](https://jspang.com/post/flutter1.html)

##### 准备

[FlutterSDK下载]([https://flutter.io/docs/development/tools/sdk/archive?tab=macos#macos) 下载最新版

[Java环境](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)  选择`Mac OS X x64`同意协议后可下载安装包

[Android Studio](https://developer.android.com/) 安装最新版本

[vs code](https://code.visualstudio.com) 安装最新版本


##### 安装Flutter

将下载好的`flutter`拖到应用程序中,然后在`应用程序`中找到`fultter`拖到命令行中得到`flutter`路径 

在终端执行

```
open .bash_profile
```

依次将这三句话复制加进去
   
```
export PUB_HOSTED_URL=https://pub.flutter-io.cn

```

```
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

```

```
export PATH=/Applications/flutter/bin:$PATH

```

关闭保存,打开终端输入

```
source ~/.bash_profile
```

完成后,验证是否安装成功

```
flutter -h
```
出现如下结果代表安装顺利 

![image.png](https://upload-images.jianshu.io/upload_images/1419035-5dd39fb9769f6624.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


检测`Flutter`的依赖项 ，终端执行
```
flutter doctor
```

##### 安装Android Studio

首先运行`java`环境 一直下一部直到完成

[安装教程Android Studio](https://www.cnblogs.com/xiadewang/p/7820377.html)

安装结束后命令行输入如下命令

```
flutter doctor --android-licenses
```


打开Android Stuido 软件，然后找到Plugin的配置，搜索Flutter插件,搜索flutter,点击右侧install,完成后重启


![image.png](https://upload-images.jianshu.io/upload_images/1419035-18a0ffe388516631.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


---

##### 配置brew

依次输入到终端

```
brew install --HEAD libimobiledevice
brew install ideviceinstaller
brew install ios-deploy
brew install cocoapods
pod setup

```

---
##### 安装VSCode
直接点击安装包安装

打开VSCode的`Flutter`插件界面，然后用在搜索框中输入`Flutter`,第一个就是`Flutter`插件了。点击`install`就可以进行安装了,安装后restart

---

到此安装环境结束

##### 试运行模拟器
新建一个项目,在命令行模式输入`flutter run`会自动启动模拟器

![image.png](https://upload-images.jianshu.io/upload_images/1419035-5482d4188f2ab43c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

---

##### 其他

可能需要安装的插件 

`Awesome Flutter Snippets` 快捷生成代码插件

`path` 快速导入文件路径
### 02搭建项目
本节设计到的wiget

>StatefulWidget具有可变状态的窗口部件，也就是你在使用应用的时候就可以随时变化，比如我们常见的进度条，随着进度不断变化,调用的快捷键`stful`

>StatelessWidget不可变状态窗口部件，也就是你在使用时不可以改变，比如固定的文字（写上后就在那里了，死也不会变了,调用的快捷键`stless`




### 03底部导航条制作

风格

* Material Design 是由Google推出的全新设计语言，这种设计语言是为手机、平板电脑、台式机和其他平台提供一致，更广泛的外观和感觉。我喜欢称它为纸墨设计。Material Design 风格是一种非常有质感的设计风格，并会提供一些默认的交互动画 包含 `material.dart`
	
* cupertino风格：即IOS风格组件，它重现了很多经典的有IOS特性的交互和界面风格，让适用于IOS的人感觉亲切和友好包含`cupertino.dart`

创建数组  `final List bottomTabs = []`

底部item `BottomNavigationBarItem`

### 04底部导航栏切换效果

初始化方法

```
  @override
  void initState() {
    super.initState();
    currentPage =tabBodies[currentIndex];
  }
```

点击事件

```
   onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
   },
```

body: currentPage,

![Untitled.gif](https://upload-images.jianshu.io/upload_images/1419035-abeba31150c47258.gif?imageMogr2/auto-orient/strip)
### 05Dio基础_引入和简单的Get请求

引入dio  `dio: ^2.0.9`

测试url `https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian?name=大胸美女`


### 06.Dio基础_Get请求和动态组件协作

### 常用的快捷键
运行项目 `flutter run`

创建项目 `flutter create xxx`

在vscode中的命令行模式下

r 键：点击后热加载，也就算是重新加载吧。

p 键：显示网格，这个可以很好的掌握布局情况，工作中很有用。

o 键：切换android和ios的预览模式。

q 键：退出调试预览模式。

### 代码规范
flutetr严格区分大小写,项目名称必须是小写

### 资源
[黑马两小时掌握Flutter移动App开发](https://pan.baidu.com/s/1NNSLfbKeRQ_fnU4Uisfldw) `提取码qfwe`

[flutter插件列表](https://github.com/Solido/awesome-flutter)

### Dart语法

[中文文档](https://www.kancloud.cn/marswill/dark2_document#/dashboard)
---
### Widget

### TextWidget

>TextAlign属性就是文本的对齐方式，
>>center: 文本以居中形式对齐,这个也算比较常用的了。<br/>
>>left:左对齐，经常使用，让文本居左进行对齐，效果和start一样。<br/>
>>right :右对齐，使用频率也不算高。<br/>
>>start:以开始位置进行对齐，类似于左对齐。<br/>
>>end: 以为本结尾处进行对齐，不常用。有点类似右对齐.<br/>

```
child:Text(
  'Hello JSPang  ,非常喜欢前端，并且愿意为此奋斗一生。我希望可以出1000集免费教程。',
   textAlign:TextAlign.left,
)

```


>maxLines属性就是设置最多显示的行数.

```
child:Text(
  'Hello JSPang  ,非常喜欢前端，并且愿意为此奋斗一生。我希望可以出1000集免费教程。',
  textAlign:TextAlign.left,
  maxLines: 1,
)
```

>overflow属性属性是用来设置文本溢出时.
>>clip：直接切断，剩下的文字就没有了，感觉不太友好，体验性不好。
>>ellipsis:在后边显示省略号，体验性较好，这个在工作中经常使用。
>>fade: 溢出的部分会进行一个渐变消失的效果，当然是上线的渐变，不是左右的哦。

### Container
>Alignment属性这个属性针对的是Container内child的对齐方式，也就是容器子内容的对齐方式，并不是容器本身的对齐方式

```
bottomCenter:下部居中对齐
botomLeft: 下部左对齐。
bottomRight：下部右对齐。
center：纵横双向居中对齐。
centerLeft：纵向居中横向居左对齐。
centerRight：纵向居中横向居右对齐。
topLeft：顶部左侧对齐。
topCenter：顶部居中对齐。
topRight： 顶部居左对齐。

```

>设置宽、高和颜色属性设置宽、高和颜色属性是相对容易的，只要在属性名称后面加入浮点型数字就可以了，比如要设置宽是500，高是400，颜色为亮蓝色。代码如下

```
child:Container(
  child:new Text('Hello JSPang',style: TextStyle(fontSize: 40.0),),
  alignment: Alignment.center,
  width:500.0,
  height:400.0,
  color: Colors.lightBlue,
),
```
>padding属性padding的属性就是一个内边距，它和你使用的前端技术CSS里的padding表现形式一样，指的是Container边缘和child内容的距离

```
child:Container(
  child:new Text('Hello JSPang',style: TextStyle(fontSize: 40.0),),
  alignment: Alignment.topLeft,
  width:500.0,
  height:400.0,
  color: Colors.lightBlue,
  padding:const EdgeInsets.all(10.0),
),
```


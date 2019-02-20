## 百姓生活APP学习记录

**目录**

[01环境搭建](#01环境搭建)

[02搭建项目](#02搭建项目)

[03底部导航条制作](#03底部导航条制作)

[04底部导航栏切换效果](#04底部导航栏切换效果)

[05Dio基础_引入和简单的Get请求](#05Dio基础_引入和简单的Get请求)


### 01环境搭建

>首先感谢`技术胖`大神视频博客讲解,笔记是根据技术胖博客和视频整理而成,你也可以直接浏览`技术胖`[技术博客](http://jspang.com/post/flutter1.html)学习,再次感谢!

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

-

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

快捷键 

* stful 动态组件
* stless 静态组件

### 03底部导航条制作

风格

* material 立体 包含 `material.dart`
	
* cupertino 仿iOS 包含`cupertino.dart`

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

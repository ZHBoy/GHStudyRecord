## 百姓生活

#### 01 环境搭建
#### 02 搭建项目
快捷键 

* stful 动态组件
* stless 静态组件

#### 03 底部导航条制作

风格

* material 立体
	
* cupertino 仿iOS

创建数组   `final List bottomTabs = []`

底部item `BottomNavigationBarItem`

#### 04 底部导航栏切换效果

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
#### 05 Dio基础_引入和简单的Get请求

引入dio  `dio: ^2.0.9`

测试url `https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian?name=大胸美女`

# Text Widget

---

> 负责显示文本和定义显示样式的控件

##### TextAlign 文本对齐方式

center: 文本以居中形式对齐,这个也算比较常用的了。

left:左对齐，经常使用，让文本居左进行对齐，效果和start一样。

right :右对齐，使用频率也不算高。

start:以开始位置进行对齐，类似于左对齐。

end: 以为本结尾处进行对齐，不常用。有点类似右对齐.

---


##### maxLines 设置最多显示的行数

---

##### overflow 属性是用来设置文本溢出时，如何处理

clip：超出部分直接裁切.

ellipsis:在后边显示省略号.

fade: 溢出的部分会进行一个渐变消失的效果.

---

##### style

```
	child: new Text (
		'我是文本控件',
		textAlign: TextAlign.right, // 右对齐
		overflow: TextOverflow.fade, 
		maxLines: 1, // 最多显示1行
		style: TextStyle(
		fontSize: 40,  // 字号
		color:Color.fromARGB(255, 255, 150, 150), // 字体颜色
    ),
    
```

---



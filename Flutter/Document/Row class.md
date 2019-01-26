# Row class

>A widget that displays its children in a horizontal array.
>
>一个小部件，用于在水平数组中显示其子项。


To cause a child to expand to fill the available horizontal space, wrap the child in an Expanded widget.
>要使子项扩展以填充可用的水平空间，请将子项包装在Expanded小部件中。


The Row widget does not scroll (and in general it is considered an error to have more children in a Row than will fit in the available room). If you have a line of widgets and want them to be able to scroll if there is insufficient room, consider using a ListView.For a vertical variant, see Column.
>“行”窗口小部件不会滚动（并且通常将行中的子项多于可用空间中的子项视为错误）。如果您有一系列小部件并希望它们能够在没有足够空间时滚动，请考虑使用ListView 有关垂直变体，请参见列


If you only have one child, then consider using Align or Center to position the child.
>如果您只有一个孩子，请考虑使用Align或Center来定位孩子。

Sample
This example divides the available space into three (horizontally), and places text centered in the first two cells and the Flutter logo centered in the third:
>此示例将可用空间划分为三个（水平），并将文本放在前两个单元格的中心，将Flutter徽标放在第三个中心


assignment

	Row(
	  children: <Widget>[
	    Expanded(
	      child: Text('Deliver features faster', textAlign: TextAlign.center),
	    ),
	    Expanded(
	      child: Text('Craft beautiful UIs', textAlign: TextAlign.center),
	    ),
	    Expanded(
	      child: FittedBox(
	        fit: BoxFit.contain, // otherwise the logo will be tiny
	        child: const FlutterLogo(),
	      ),
	    ),
	  ],
	)

Why does my row have a yellow and black warning stripe?
If the non-flexible contents of the row (those that are not wrapped in Expanded or Flexible widgets) are together wider than the row itself, then the row is said to have overflowed. When a row overflows, the row does not have any remaining space to share between its Expanded and Flexible children. The row reports this by drawing a yellow and black striped warning box on the edge that is overflowing. If there is room on the outside of the row, the amount of overflow is printed in red lettering.
>为什么我的行有黄色和黑色警告条纹？
如果行的非灵活内容（那些未包含在Expanded或Flexible小部件中的内容）在一起比行本身宽，则说该行已溢出。当行溢出时，该行没有任何剩余空间可在其Expanded和Flexible子级之间共享。该行通过在溢出的边缘上绘制黄色和黑色条纹警告框来报告此情况。如果行外侧有空间，则溢出量以红色字体打印。


Sample
Story time
Suppose, for instance, that you had this code:
>例如，假设你有这个代码


assignment

	Row(
	  children: <Widget>[
	    const FlutterLogo(),
	    const Text('Flutter\'s hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.'),
	    const Icon(Icons.sentiment_very_satisfied),
	  ],
	)
	
The row first asks its first child, the FlutterLogo, to lay out, at whatever size the logo would like. The logo is friendly and happily decides to be 24 pixels to a side. This leaves lots of room for the next child. The row then asks that next child, the text, to lay out, at whatever size it thinks is best.
>该行首先要求它的第一个孩子FlutterLogo按照徽标的大小进行布局。徽标很友好，很高兴地决定一边是24像素。这为下一个孩子留下了很多空间。然后该行要求下一个孩子，即文本，以其认为最好的大小布局。


At this point, the text, not knowing how wide is too wide, says "Ok, I will be thiiiiiiiiiiiiiiiiiiiis wide.", and goes well beyond the space that the row has available, not wrapping. The row responds, "That's not fair, now I have no more room available for my other children!", and gets angry and sprouts a yellow and black strip.
>在这一点上，文字，不知道有多宽太宽，说“好吧，我将thiiiiiiiiiiiiiiiiiiiis宽。”，并远远超出行可用的空间，而不是包装。一排回答说：“那不公平，现在我已经没有其他孩子的空间了！”，并生气，发芽出一条黄色和黑色的条状。


Sample
The fix is to wrap the second child in an Expanded widget, which tells the row that the child should be given the remaining room:
>解决方法是将第二个子项包装在Expanded小部件中，该小部件告诉该行应该为该子项提供剩余空间
>
assignment

	Row(
	  children: <Widget>[
	    const FlutterLogo(),
	    const Expanded(
	      child: Text('Flutter\'s hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.'),
	    ),
	    const Icon(Icons.sentiment_very_satisfied),
	  ],
	)
Now, the row first asks the logo to lay out, and then asks the icon to lay out. The Icon, like the logo, is happy to take on a reasonable size (also 24 pixels, not coincidentally, since both FlutterLogo and Icon honor the ambient IconTheme). This leaves some room left over, and now the row tells the text exactly how wide to be: the exact width of the remaining space. The text, now happy to comply to a reasonable request, wraps the text within that width, and you end up with a paragraph split over several lines.
>现在，该行首先要求徽标布局，然后要求图标布局。象徽标一样，Icon很乐意采用合理的尺寸（也是24像素，而不是巧合，因为FlutterLogo和Icon都尊重环境IconTheme）。这留下了一些空间，现在该行告诉文本确切的宽度：剩余空间的确切宽度。现在很高兴遵守合理要求的文本将文本包装在该宽度内，最后你会得到一个分成几行的段落。
>
Layout algorithm
This section describes how a Row is rendered by the framework. See BoxConstraints for an introduction to box layout models.
>布局算法
本节描述框架如何呈现Row。有关框布局模型的介绍，请参阅BoxConstraints。

Layout for a Row proceeds in six steps:

Layout each child a null or zero flex factor (e.g., those that are not Expanded) with unbounded horizontal constraints and the incoming vertical constraints. If the crossAxisAlignment is CrossAxisAlignment.stretch, instead use tight vertical constraints that match the incoming max height.
Divide the remaining horizontal space among the children with non-zero flex factors (e.g., those that are Expanded) according to their flex factor. For example, a child with a flex factor of 2.0 will receive twice the amount of horizontal space as a child with a flex factor of 1.0.
Layout each of the remaining children with the same vertical constraints as in step 1, but instead of using unbounded horizontal constraints, use horizontal constraints based on the amount of space allocated in step 2. Children with Flexible.fit properties that are FlexFit.tight are given tight constraints (i.e., forced to fill the allocated space), and children with Flexible.fit properties that are FlexFit.loose are given loose constrai

>行的布局分六步进行：<br/>
使用无界水平约束和传入垂直约束将每个子布局为零或零弯曲因子（例如，未展开的因子）。如果crossAxisAlignment是CrossAxisAlignment.stretch，则使用与传入的最大高度匹配的紧密垂直约束。
根据灵活因子，将具有非零弯曲因子（例如，扩展的那些）的孩子之间的剩余水平空间划分。例如，flex因子为2.0的孩子将获得两倍于水平空间的孩子，其灵活系数为1.0。
使用与步骤1中相同的垂直约束对每个剩余子项进行布局，但不使用无界水平约束，而是使用基于步骤2中分配的空间量的水平约束。具有FlexFit.tight的Flexible.fit属性的子项是给定严格约束（即，强制填充分配的空间），FlexFit.loose具有Flexible.fit属性的子项被赋予松散约束
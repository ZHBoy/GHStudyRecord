# Column class

A widget that displays its children in a vertical array.
>一个窗口小部件，用于在垂直数组中显示其子项


To cause a child to expand to fill the available vertical space, wrap the child in an Expanded widget.
>要使子项扩展以填充可用的垂直空间，请将子项包装在Expanded小部件中


The Column widget does not scroll (and in general it is considered an error to have more children in a Column than will fit in the available room). If you have a line of widgets and want them to be able to scroll if there is insufficient room, consider using a ListView.
>“列”窗口小部件不会滚动（并且通常认为列中的子项多于可用空间中的子项，这被视为错误）。如果您有一系列小部件并希望它们能够在没有足够空间时滚动，请考虑使用ListView。


If you only have one child, then consider using Align or Center to position the child.
>如果您只有一个孩子，请考虑使用Align或Center来定位孩子。


Sample
This example uses a Column to arrange three widgets vertically, the last being made to fill all the remaining space.
>此示例使用Column垂直排列三个小部件，最后一个小部件用于填充所有剩余空间。


assignment

	Column(
	  children: <Widget>[
	    Text('Deliver features faster'),
	    Text('Craft beautiful UIs'),
	    Expanded(
	      child: FittedBox(
	        fit: BoxFit.contain, // otherwise the logo will be tiny
	        child: const FlutterLogo(),
	      ),
	    ),
	  ],
	)
Sample

In the sample above, the text and the logo are centered on each line. In the following example, the crossAxisAlignment is set to CrossAxisAlignment.start, so that the children are left-aligned. The mainAxisSize is set to MainAxisSize.min, so that the column shrinks to fit the children.
>在上面的示例中，文本和徽标以每一行为中心。在以下示例中，crossAxisAlignment设置为CrossAxisAlignment.start，以便子项左对齐。 mainAxisSize设置为MainAxisSize.min，以便列缩小以适合子项。


assignment

	Column(
	  crossAxisAlignment: CrossAxisAlignment.start,
	  mainAxisSize: MainAxisSize.min,
	  children: <Widget>[
	    Text('We move under cover and we move as one'),
	    Text('Through the night, we have one shot to live another day'),
	    Text('We cannot let a stray gunshot give us away'),
	    Text('We will fight up close, seize the moment and stay in it'),
	    Text('It’s either that or meet the business end of a bayonet'),
	    Text('The code word is ‘Rochambeau,’ dig me?'),
	    Text('Rochambeau!', style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0)),
	  ],
	)
	
When the incoming vertical constraints are unbounded
When a Column has one or more Expanded or Flexible children, and is placed in another Column, or in a ListView, or in some other context that does not provide a maximum height constraint for the Column, you will get an exception at runtime saying that there are children with non-zero flex but the vertical constraints are unbounded.
>当传入的垂直约束无限制时
当Column具有一个或多个Expanded或Flexible子项，并且放在另一个Column，ListView或其他不为Column提供最大高度约束的上下文中时，您将在运行时获得一个异常，说明有非零弯曲的孩子，但垂直约束是无界限的。正如在该例外的细节中所描述的那样，问题在于使用Flexible或Expanded意味着布局所有其他子节点之后的剩余空间必须平等分配，但如果传入的垂直约束是无界的，则存在无限剩余空间。

The problem, as described in the details that accompany that exception, is that using Flexible or Expanded means that the remaining space after laying out all the other children must be shared equally, but if the incoming vertical constraints are unbounded, there is infinite remaining space.
>当列的内容超过可用空间量时，列溢出，内容被剪切。在调试模式下，在溢出的边缘处呈现黄色和黑色条纹条以指示问题，并在列下方打印一条消息，指出检测到多少溢出。

The key to solving this problem is usually to determine why the Column is receiving unbounded vertical constraints.
>通常的解决方案是使用ListView而不是Column，以便在垂直空间有限时启用内容滚动。

One common reason for this to happen is that the Column has been placed in another Column (without using Expanded or Flexible around the inner nested Column). When a Column lays out its non-flex children (those that have neither Expanded or Flexible around them), it gives them unbounded constraints so that they can determine their own dimensions (passing unbounded constraints usually signals to the child that it should shrink-wrap its contents). The solution in this case is typically to just wrap the inner column in an Expanded to indicate that it should take the remaining space of the outer column, rather than being allowed to take any amount of room it desires.

Another reason for this message to be displayed is nesting a Column inside a ListView or other vertical scrollable. In that scenario, there really is infinite vertical space (the whole point of a vertical scrolling list is to allow infinite space vertically). In such scenarios, it is usually worth examining why the inner Column should have an Expanded or Flexible child: what size should the inner children really be? The solution in this case is typically to remove the Expanded or Flexible widgets from around the inner children.

For more discussion about constraints, see BoxConstraints.

The yellow and black striped banner
When the contents of a Column exceed the amount of space available, the Column overflows, and the contents are clipped. In debug mode, a yellow and black striped bar is rendered at the overflowing edge to indicate the problem, and a message is printed below the Column saying how much overflow was detected.

The usual solution is to use a ListView rather than a Column, to enable the contents to scroll when vertical space is limited.

Layout algorithm
This section describes how a Column is rendered by the framework. See BoxConstraints for an introduction to box layout models.

Layout for a Column proceeds in six steps:

Layout each child a null or zero flex factor (e.g., those that are not Expanded) with unbounded vertical constraints and the incoming horizontal constraints. If the crossAxisAlignment is CrossAxisAlignment.stretch, instead use tight horizontal constraints that match the incoming max width.
Divide the remaining vertical space among the children with non-zero flex factors (e.g., those that are Expande
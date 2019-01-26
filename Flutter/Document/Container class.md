# Container class

>A convenience widget that combines common painting, positioning, and sizing widgets.<br/>
一个便利的小部件，结合了常见的绘画，定位和大小调整小部件。

>A container first surrounds the child with padding (inflated by any borders present in the decoration) and then applies additional constraints to the padded extent (incorporating the width and height as constraints, if either is non-null). The container is then surrounded by additional empty space described from the margin.<br/>

>容器首先用填充物围绕孩子（由装饰中存在的任何边界膨胀），然后对填充范围应用附加约束（将宽度和高度合并为约束，如果其中任何一个为非空）。然后容器被边缘描述的额外空的空间包围。


>During painting, the container first applies the given transform, then paints the decoration to fill the padded extent, then it paints the child, and finally paints the foregroundDecoration, also filling the padded extent.

>在绘画过程中，容器首先应用给定的变换，然后绘制装饰以填充填充范围，然后绘制孩子，最后绘制foregroundDecoration，同时填充填充范围。

>
Containers with no children try to be as big as possible unless the incoming constraints are unbounded, in which case they try to be as small as possible. Containers with children size themselves to their children. The width, height, and constraints arguments to the constructor override this.

>没有孩子的容器试图尽可能大，除非传入的约束是无限制的，在这种情况下，它们尽可能地小。容纳孩子的容器尺寸。构造函数的width，height和constraints参数会覆盖它。

>
Layout behavior
See BoxConstraints for an introduction to box layout models.

>布局行为

>有关框布局模型的介绍，请参阅BoxConstraints。
>

>Since Container combines a number of other widgets each with their own layout behavior, Container's layout behavior is somewhat complicated.

>由于Container结合了许多其他小部件，每个小部件都有自己的布局行为，因此Container的布局行为有点复杂。

>tl;dr: Container tries, in order: to honor alignment, to size itself to the child, to honor the width, height, and constraints, to expand to fit the parent, to be as small as possible.

>tl; dr：容器尝试，按顺序：为了尊重对齐，为子尺寸调整自己的大小，以尊重宽度，高度和约束，扩展以适应父级，尽可能小。

>More specifically:
>
>进一步来说：

>If the widget has no child, no height, no width, no constraints, and the parent provides unbounded constraints, then Container tries to size as small as possible.
>
>如果窗口小部件没有子节点，没有高度，没有宽度，没有约束，并且父节点提供无限制约束，则Container尝试尽可能小。

>If the widget has no child and no alignment, but a height, width, or constraints are provided, then the Container tries to be as small as possible given the combination of those constraints and the parent's constraints.
>
>如果窗口小部件没有子节点且没有对齐，但提供了高度，宽度或约束，则在给定这些约束和父节点约束的组合的情况下，Container会尽可能小。

>If the widget has no child, no height, no width, no constraints, and no alignment, but the parent provides bounded constraints, then Container expands to fit the constraints provided by the parent.

>如果窗口小部件没有子节点，没有高度，没有宽度，没有约束，没有对齐，但是父节点提供了有界约束，则Container会扩展以适应父节点提供的约束。

>If the widget has an alignment, and the parent provides unbounded constraints, then the Container tries to size itself around the child.
>
>如果窗口小部件具有对齐，并且父窗口提供无限制约束，则Container会尝试围绕子窗口调整自身大小。

>If the widget has an alignment, and the parent provides bounded constraints, then the Container tries to expand to fit the parent, and then positions the child within itself as per the alignment.
>
>如果窗口小部件具有对齐，并且父窗口提供有界约束，则Container会尝试展开以适合父窗口，然后根据对齐方式将子项置于其自身内部。

>Otherwise, the widget has a child but no height, no width, no constraints, and no alignment, and the Container passes the constraints from the parent to the child and sizes itself to match the child.
>
>否则，窗口小部件具有子级但没有高度，没有宽度，没有约束，也没有对齐，并且Container将约束从父级传递给子级并调整其大小以匹配子级

>The margin and padding properties also affect the layout, as described in the documentation for those properties. (Their effects merely augment the rules described above.) The decoration can implicitly increase the padding (e.g. borders in a BoxDecoration contribute to the padding); see Decoration.padding.
>
>边距和填充属性也会影响布局，如这些属性的文档中所述。 （它们的效果仅仅增加了上述规则。）装饰可以隐含地增加填充（例如，BoxDecoration中的边界有助于填充）;请参阅Decoration.padding。

>Sample This example shows a 48x48 green square (placed inside a Center widget in case the parent widget has its own opinions regarding the size that the Container should take), with a margin so that it stays away from neighboring widgets:
>
>样品此示例显示了一个48x48绿色方块（放置在中心窗口小部件中，以防父窗口小部件有关于容器应采用的大小的自己的意见），并带有边距以使其远离相邻窗口小部件：

assignment
```
Center(
  child: Container(
    margin: const EdgeInsets.all(10.0),
    color: const Color(0xFF00FF00),
    width: 48.0,
    height: 48.0,
  ),
)
```

>Sample This example shows how to use many of the features of Container at once. The constraints are set to fit the font size plus ample headroom vertically, while expanding horizontally to fit the parent. The padding is used to make sure there is space between the contents and the text. The color makes the box teal. The alignment causes the child to be centered in the box. The foregroundDecoration overlays a nine-patch image onto the text. Finally, the transform applies a slight rotation to the entire contraption to complete the effect.
>
>样品此示例显示如何一次使用Container的许多功能。设置约束以适应字体大小和垂直充足的净空，同时水平扩展以适合父级。填充用于确保内容和文本之间有空格。颜色使盒子青色。对齐使孩子在盒子中居中。 foregroundDecoration将九个补丁图像叠加到文本上。最后，变换对整个装置应用轻微旋转以完成效果

assignment
```
Container(
  constraints: BoxConstraints.expand(
    height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
  ),
  padding: const EdgeInsets.all(8.0),
  color: Colors.teal.shade700,
  alignment: Alignment.center,
  child: Text('Hello World', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white)),
  foregroundDecoration: BoxDecoration(
    image: DecorationImage(
      image: NetworkImage('https://www.example.com/images/frame.png'),
      centerSlice: Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
    ),
  ),
  transform: Matrix4.rotationZ(0.1),
)
```


>AnimatedContainer, a variant that smoothly animates the properties when they change.
Border, which has a sample which uses Container heavily.
Ink, which paints a Decoration on a Material, allowing InkResponse and InkWell splashes to paint over them.
The catalog of layout widgets.
Inheritance
Object Diagnosticable DiagnosticableTree Widget StatelessWidget Container
Constructors
>
>AnimatedContainer，一种在变化时平滑动画属性的变体。
边框，其中包含大量使用Container的示例。
墨水，在材质上绘制装饰，允许InkResponse和InkWell喷溅在它们上面绘画。
布局小部件的目录。
遗产
Object Diagnosticable DiagnosticableTree Widget StatelessWidget容器
构造函数

Container({Key key, AlignmentGeometry alignment, EdgeInsetsGeometry padding, Color color, Decoration decoration, Decoration foregroundDecoration, double width, double height, BoxConstraints constraints, EdgeInsetsGeometry margin, Matrix4 transform, Widget child })

# Placeholder class

A widget that draws a box that represents where other widgets will one day be added.
>一个小部件，它绘制一个框，表示有一天会添加其他小部件的位置。

This widget is useful during development to indicate that the interface is not yet complete.
>此小组件在开发期间非常有用，表示接口尚未完成。


By default, the placeholder is sized to fit its container. If the placeholder is in an unbounded space, it will size itself according to the given fallbackWidth and fallbackHeight.
>默认情况下，占位符的大小适合其容器。如果占位符位于无界空间中，它将根据给定的fallbackWidth和fallbackHeight自行调整大小。

Inheritance
Object Diagnosticable DiagnosticableTree Widget StatelessWidget Placeholder
Constructors
>遗产
Object Diagnosticable DiagnosticableTree Widget StatelessWidget占位符
构造函数

Placeholder({Key key, Color color: const Color(0xFF455A64), double strokeWidth: 2.0, double fallbackWidth: 400.0, double fallbackHeight: 400.0 })
Creates a widget which draws a box.
const
Properties
>创建一个绘制框的小部件。
常量
属性

color → Color 颜色→颜色

The color to draw the placeholder box.
final
>绘制占位符框的颜色。
最后

fallbackHeight → double fallbackHeight→双倍
The height to use when the placeholder is in a situation with an unbounded height. [...]
>占位符处于无限高度的情况下使用的高度。 [...]

fallbackWidth → double fallbackWidth→double
The width to use when the placeholder is in a situation with an unbounded width. [...]
>占位符处于无限宽度的情况下使用的宽度。 [...]

strokeWidth → double strokeWidth→双倍

The width of the lines in the placeholder box.
>占位符框中行的宽度。
 
hashCode → int hashCode→int
The hash code for this object. [...]
read-only, inherited
key → Key
Controls how one widget replaces another widget in the tree. [...]
final, inherited
runtimeType → Type
A representation of the runtime type of the object.
read-only, inherited
Methods

build(BuildContext context) → Widget
Describes the part of the user interface represented by this widget. [...]
override
createElement() → StatelessElement
Creates a StatelessElement to manage this widget's location in the tree. [...]
inherited
debugDescribeChildren() → List<DiagnosticsNode>
Returns a list of DiagnosticsNode objects describing this node's children. [...]
@protected, inherited
debugFillProperties(DiagnosticPropertiesBuilder properties) → void
Add additional properties associated with the node. [...]
inherited
noSuchMethod(Invocation invocation) → dynamic
Invoked when a non-existent method or property is accessed. [...]
inherited
toDiagnosticsNode({String name, DiagnosticsTreeStyle style }) → DiagnosticsNode
Returns a debug representation of the object that is used by debugging tools and by toStringDeep. [...]
inherited
toString({DiagnosticLevel minLevel: DiagnosticLevel.debug }) → String
Returns a string representation of this object.
inherited
toStringDeep({String prefixLineOne: '', String prefixOtherLines, DiagnosticLevel minLevel: DiagnosticLevel.debug }) → String
Returns a string representation of this node and its descendants. [...]
inherited
toStringShallow({String joiner: ', ', DiagnosticLevel minLevel: DiagnosticLevel.debug }) → String
Returns a one-line detailed description of the object. [...]
inherited
toStringShort() → String
A short, textual description of this widget.
inherited
# AbsorbPointer class 类


A widget that absorbs pointers during hit testing.

在命中测试期间吸收指针的小部件。

>When absorbing is true, this widget prevents its subtree from receiving pointer events by terminating hit testing at itself. It still consumes space during layout and paints its child as usual. It just prevents its children from being the target of located events, because it returns true from RenderBox.hitTest.
>
当吸收为真时，此小部件通过终止命中测试来阻止其子树接收指针事件。它仍然会在布局过程中消耗空间并像往常一样对孩子进行绘画。它只是阻止它的子节点成为定位事件的目标，因为它从RenderBox.hitTest返回true。

See also:

>IgnorePointer, which also prevents its children from receiving pointer events but is itself invisible to hit testing.
Inheritance
Object Diagnosticable DiagnosticableTree Widget RenderObjectWidget SingleChildRenderObjectWidget AbsorbPointer
Constructors<br/>
IgnorePointer，它也可以防止它的子节点接收指针事件，但它本身对于命中测试是不可见的。
遗产
Object Diagnosticable DiagnosticableTree Widget RenderObjectWidget SingleChildRenderObjectWidget AbsorbPointer
构造函数


AbsorbPointer({Key key, bool absorbing: true, Widget child, bool ignoringSemantics })

>Creates a widget that absorbs pointers during hit testing. [...]
const
Properties


>创建一个在命中测试期间吸收指针的小部件。 [...]
常量
属性


absorbing → bool 吸收→布尔
>Whether this widget absorbs pointers during hit testing. [...]final
这个小部件是否在命中测试期间吸收指针。 [...]最后

ignoringSemantics → bool 忽略语义→布尔
>Whether the semantics of this render object is ignored when compiling the semantics tree. [...]
final
>编译语义树时是否忽略此渲染对象的语义。 [...] 最后

child → Widget 孩子→小工具
>The widget below this widget in the tree. [...]
final, inherited<br/>
树中此小部件下方的小部件。 [...]
最后，继承

hashCode → int hashCode→int
>The hash code for this object. [...]
read-only, inherited<br/>
此对象的哈希码。 [...]
只读，继承
 
key → Key 键→键
>Controls how one widget replaces another widget in the tree. [...]
final, inherited <br/>
控制一个小部件如何替换树中的另一个小部件。 [...]
最后，继承

runtimeType → Type runtimeType→类型
>A representation of the runtime type of the object.
read-only, inherited
Methods<br/>
表示对象的运行时类型。
只读，继承
方法


createRenderObject(BuildContext context) → RenderAbsorbPointer
Creates an instance of the RenderObject class that this RenderObjectWidget represents, using the configuration described by this RenderObjectWidget. [...]
override
debugFillProperties(DiagnosticPropertiesBuilder properties) → void
Add additional properties associated with the node. [...]
override
updateRenderObject(BuildContext context, covariant RenderAbsorbPointer renderObject) → void
Copies the configuration described by this RenderObjectWidget to the given RenderObject, which will be of the same type as returned by this object's createRenderObject. [...]
override
createElement() → SingleChildRenderObjectElement
RenderObjectWidgets always inflate to a RenderObjectElement subclass.
inherited
debugDescribeChildren() → List<DiagnosticsNode>
Returns a list of DiagnosticsNode objects describing this node's children. [...]
@protected, inherited
didUnmountRenderObject(covariant RenderObject renderObject) → void
A render object previously associated with this widget has been removed from the tree. The given RenderObject will be of the same type as returned by this object's createRenderObject.
@protected, inherited
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
Operators

operator ==(dynamic other) → bool
The equality operator. [...]
inherited
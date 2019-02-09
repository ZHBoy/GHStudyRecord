# API随记

创建工程 flutter create xxx
快速创建控件 sft

快速构造一个listView

```
class _HomeListViewState extends State<HomeListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context,int index){
          return HomeListItem();
        },
    );
      
  }
}
```
import 'package:flutter/material.dart';

class HomeListItem extends StatelessWidget {

  Widget item(){
    return Row(
      children: <Widget>[
        Icon(
          Icons.search,
        ),
        SizedBox(
          width: 3.0,
        ),
        Text(
          '作者名称',
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        
        children: <Widget>[
          Text(
            '这个是标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题',
          ),
          Row(
            children: <Widget>[
              item(),
            ],
          ),
          Row(
            children: <Widget>[
              Text('正文'),
            ],
          ),
          Row(
            children: <Widget>[
              Text('点赞和喜欢'),
            ],
          ),
        ],
      
      ),
    );
  }
}

import 'package:flutter/material.dart';
import './homeListItem.dart';


class HomeListView extends StatefulWidget {
  _HomeListViewState createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {
  @override
  Widget build(BuildContext context) {
    return HomeListItem();
  }
}
import 'package:flutter/material.dart';
import 'package:hackernews/widget/scene/list/article_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hacker News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ArticleList()
    );
  }
}

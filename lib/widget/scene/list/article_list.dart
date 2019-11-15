import 'package:flutter/material.dart';
import 'package:hackernews/model/article_detail_model.dart';
import 'package:hackernews/model/article_list_model.dart';
import 'package:hackernews/widget/scene/detail/article_detail.dart';
import 'package:provider/provider.dart';

class ArticleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => ArticleListModel()..request(),
      child: ArticleListBody(),
    );
  }
}

class ArticleListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleListModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: const Text('Hacker News Reader')),
        body: ListView.builder(
          itemCount: model.articleList.length,
          itemBuilder: (context, index) => SizedBox(
            width: MediaQuery.of(context).size.width,
            child:
              InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ArticleDetail(id: model.articleList[index].id))
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(model.articleList[index].title == null ? '${model.articleList[index].id}' : model.articleList[index].title),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

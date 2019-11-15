import 'package:flutter/material.dart';
import 'package:hackernews/model/article.dart';
import 'package:hackernews/repository/article_request.dart';
import 'package:hackernews/repository/top_stories_request.dart';

class ArticleListModel extends ChangeNotifier {
  final _articleList = <Article>[];

  Future<void> request() async {
    final ids = await TopStoriesRequest().request();
    appendAll(ids.getRange(0, 20).map((id) => Article.fromId(id)));
  }

  List<Article> get articleList {
    return _articleList;
  }

  void append(Article article) {
    _articleList.add(article);
    notifyListeners();
  }

  void appendAll(Iterable<Article> articles) {
    _articleList.addAll(articles);
    notifyListeners();
  }

  void replace(Article newArticle, int index) {
    _articleList[index] = newArticle;
    notifyListeners();
  }
}
import 'package:flutter/material.dart';
import 'package:hackernews/model/article.dart';
import 'package:hackernews/repository/article_request.dart';

class ArticleDetailModel extends ChangeNotifier {
  Article _article;

  Future<void> request(int id) async {
    article = await ArticleRequest().request(id);
  }

  Article get article {
    return _article;
  }

  set article(Article value) {
    _article = value;
    notifyListeners();
  }
}
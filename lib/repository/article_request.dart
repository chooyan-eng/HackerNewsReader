import 'dart:convert';

import 'package:hackernews/model/article.dart';
import 'package:http/http.dart';

class ArticleRequest {
  var client = Client();

  Future<Article> request(int id) async {
    final response = await client.get('https://hacker-news.firebaseio.com/v0/item/$id.json');
    return Article.fromJson(json.decode(response.body));
  }
}
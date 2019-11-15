import 'dart:convert';

import 'package:http/http.dart';

class TopStoriesRequest {
  var client = Client();

  Future<List<int>> request() async {
    var response = await client.get('https://hacker-news.firebaseio.com/v0/topstories.json');
    List<dynamic> list = json.decode(response.body);
    return list.map((id) => id as int).toList();
  }
}
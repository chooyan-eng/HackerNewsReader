import 'package:flutter_test/flutter_test.dart';
import 'package:hackernews/repository/article_request.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

const doApiCall = false;

main() {
  group('実際に API に疎通してみる', () {
    test('21544864 の記事を取得', () async {
      final response = await ArticleRequest().request(21544864);
      expect(response.id, 21544864);
    }, skip: !doApiCall);
  });

  group('パースのテスト', () {
    test('id=21544864 を指定して Mock へリクエストしたら同じ ID のデータが取得できること', () async {
      final request = ArticleRequest()..client = MockClient();
      when(request.client.get('https://hacker-news.firebaseio.com/v0/item/21544864.json'))
        .thenAnswer((_) async => http.Response('{"by": "dhouston", "id": 21544864, "title": "My YC app: Dropbox - Throw away your USB drive", "time": 1175714200, "type": "story", "kids": [1, 2, 3, 4], "score": 10, "url": "http://www.getdropbox.com/u/2/screencast.html"}', 200));

      final response = await request.request(21544864);
      expect(response.id, 21544864);
    });
  });
}
import 'package:flutter_test/flutter_test.dart';
import 'package:hackernews/repository/top_stories_request.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

const doApiCall = false;

main() {
  group('実際の API との疎通テスト', () {
    test('パラメータなしで検索したら、500件返却されること', () async {
      final ids = await TopStoriesRequest().request();
      expect(ids.length, 500);
    });
  }, skip: !doApiCall);

  group('パースのテスト', () {
    test('List<int> の形式でデータがパースできていること', () async {
      final request = TopStoriesRequest()..client = MockClient();
      when(request.client.get('https://hacker-news.firebaseio.com/v0/topstories.json'))
        .thenAnswer((_) async => http.Response('[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]', 200));

      final response = await request.request();
      expect(response, isA<List<int>>());
    });
  });

}
import 'package:flutter_test/flutter_test.dart';
import 'package:hackernews/repository/top_stories_request.dart';

const doApiCall = true;

main() {
  group('実際の API との疎通テスト', () {
    test('パラメータなしで検索したら、100件返却されること', () async {
      final ids = await TopStoriesRequest().request();
      expect(ids.length, 500);
    });
  }, skip: !doApiCall);
}
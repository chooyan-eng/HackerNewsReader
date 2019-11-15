import 'package:flutter_test/flutter_test.dart';
import 'package:hackernews/repository/article_request.dart';

main() {
  group('実際に API に疎通してみる', () {
    test('21544864 の記事を取得', () async {
      final response = await ArticleRequest().request(21544864);
      expect(response.id, 21544864);
    });
  });
}
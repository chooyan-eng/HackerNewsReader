import 'package:flutter_test/flutter_test.dart';
import 'package:hackernews/model/article_list_model.dart';

main() {
  group('実際の API との疎通', () {
    test('リクエスト後に 20 件のデータが格納されていること', () async {
      final model = ArticleListModel();
      await model.request();
      expect(model.articleList.length, 20);
    });
  });
}
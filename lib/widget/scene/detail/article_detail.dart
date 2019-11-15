import 'package:flutter/material.dart';
import 'package:hackernews/model/article_detail_model.dart';
import 'package:provider/provider.dart';

class ArticleDetail extends StatelessWidget {
  final int id;

  const ArticleDetail({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => ArticleDetailModel()..request(id),
      child: ArticleDetailBody(),
    );
  }
}

class ArticleDetailBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleDetailModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: const Text('Article Detail')),
        body: model.article == null ? Center(child: CircularProgressIndicator()) : Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(model.article.title),
              SizedBox(height: 16),
              Text(model.article.url),
            ],
          ),
        ),
      ),
    );
  }
}

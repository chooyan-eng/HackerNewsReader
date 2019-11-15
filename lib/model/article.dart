class Article {
  final int id;
  final String type;
  final String by;
  final int time;
  final String title;
  final String url;
  final int score;
  final List<int> kids;

  Article({this.id, this.type, this.by, this.time, this.title, this.url, this.score, this.kids});

  factory Article.fromJson(Map<String, dynamic> json) {
    List<dynamic> list = json['kids'];
    return Article(
      id: json['id'],
      type: json['type'],
      by: json['by'],
      time: json['time'],
      title: json['title'],
      url: json['url'],
      score: json['score'],
      kids: list.map((id) => id as int).toList(),
    );
  }

  factory Article.fromId(int id) {
    return Article(id: id);
  }

}
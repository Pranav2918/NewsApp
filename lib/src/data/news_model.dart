class News {
  final String status;
  final int totalResults;
  final List<Articles> articles;

  News(
      {required this.status,
      required this.totalResults,
      required this.articles});

  factory News.fromJson(Map<String, dynamic> json) => News(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int,
      articles: json['articles'] == null
          ? []
          : (json['articles'] as List<dynamic>)
              .map((e) => Articles.fromJson(e))
              .toList());
}

class Articles {
  final String author;
  final String title;
  final String url;
  final String publishedAt;

  Articles(
      {required this.author,
      required this.title,
      required this.url,
      required this.publishedAt});

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
      author: json['author'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      publishedAt: json['publishedAt'] as String);
}

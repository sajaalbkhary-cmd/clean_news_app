import '../../domain/entities/article.dart';

class ArticleModel extends Article {
  const ArticleModel({
    required String id,
    required String title,
    String? imageUrl,
    required DateTime publishedAt,
    required String content, required description,
  }) : super(
    id: id,
    title: title,
    imageUrl: imageUrl,
    publishedAt: publishedAt,
    content: content,
  );

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'] ?? '0',
      title: json['title'] ?? 'No Title',
      imageUrl: json['urlToImage'],
      publishedAt: DateTime.parse(json['publishedAt']),
      content: json['content'] ?? 'No Content',
      description: json['description'],
    );
  }
}
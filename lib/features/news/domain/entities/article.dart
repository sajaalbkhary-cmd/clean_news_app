class Article {
  final String id;
  final String title;
  final String? imageUrl;
  final DateTime publishedAt;
  final String content;
  final String? description; // أضف هذا

  const Article({
    required this.id,
    required this.title,
    this.imageUrl,
    required this.publishedAt,
    required this.content,
    this.description, // أضف هذا
  });
}
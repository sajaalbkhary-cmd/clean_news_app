import '../entities/article.dart';

abstract class NewsRepository {
  Future<List<Article>> getNews();
  Future<List<Article>> searchNews(String query);
}
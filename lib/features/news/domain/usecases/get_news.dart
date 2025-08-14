// TODO Implement this library.
import '../entities/article.dart';
import '../repositories/news_repository.dart';

class GetNews {
  final NewsRepository repository;

  GetNews(this.repository);

  Future<List<Article>> call() async {
    return await repository.getNews();
  }
}
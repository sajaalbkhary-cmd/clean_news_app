// TODO Implement this library.
import '../repositories/news_repository.dart';
import '../entities/article.dart';

class GetTopHeadlines {
  final NewsRepository repository;

  GetTopHeadlines(this.repository);

  Future<List<Article>> call() async {
    return await repository.getNews();
  }
}

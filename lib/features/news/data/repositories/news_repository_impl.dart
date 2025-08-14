import '../../domain/entities/article.dart';
import '../../domain/repositories/news_repository.dart';
import '../datasources/news_remote_data_source.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Article>> getNews() async {
    final articles = await remoteDataSource.getNews();
    return articles;
  }

  @override
  Future<List<Article>> searchNews(String query) {
    // TODO: implement searchNews
    throw UnimplementedError();
  }
}

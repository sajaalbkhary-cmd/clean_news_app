import 'package:dio/dio.dart';
import '../../../../core/constants/api_constants.dart';
import '../../domain/entities/article.dart';
import '../models/article_model.dart';

class NewsRemoteDataSource {
  final Dio dio;

  NewsRemoteDataSource({required this.dio});

  Future<List<Article>> getNews() async {
    try {
      final response = await dio.get(
        '${ApiConstants.baseUrl}/top-headlines',
        queryParameters: {
          'country': 'us',
          'apiKey': ApiConstants.apiKey,
        },
      );

      return (response.data['articles'] as List)
          .map((article) => ArticleModel.fromJson(article))
          .toList();
    } catch (e) {
      throw Exception('Failed to load news: $e');
    }
  }
}
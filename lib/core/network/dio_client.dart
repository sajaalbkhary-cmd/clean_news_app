import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;
  final String baseUrl;
  final String apiKey;

  DioClient({
    required this.dio,
    required this.baseUrl,
    required this.apiKey,
  }) {
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Authorization': apiKey,
        'Content-Type': 'application/json',
      },
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
  }

}
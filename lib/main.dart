import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import 'features/news/data/datasources/news_remote_data_source.dart';
import 'features/news/data/repositories/news_repository_impl.dart';
import 'features/news/domain/usecases/get_news.dart';
import 'features/news/presentation/bloc/news_bloc.dart';
import 'features/news/presentation/pages/news_list_page.dart'; // تغيير الاستيراد

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dioClient = Dio();

    final remoteDataSource = NewsRemoteDataSource(dio: dioClient);
    final newsRepository = NewsRepositoryImpl(remoteDataSource: remoteDataSource);
    final getNews = GetNews(newsRepository);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'أخبار اليوم',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Tajawal', // يمكنك استخدام خط عربي إذا أردت
      ),
      home: BlocProvider(
        create: (_) => NewsBloc(getNews: getNews)..add(FetchNews()),
        child: const NewsListPage(), // تغيير هنا لاستخدام NewsListPage
      ),
    );
  }
}
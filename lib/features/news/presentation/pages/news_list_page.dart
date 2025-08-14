import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/article.dart';
import '../bloc/news_bloc.dart';
import 'news_detail_page.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({super.key});

  get context => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('أخبار اليوم'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // سنضيف وظيفة البحث لاحقاً
            },
          ),
        ],
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return _buildLoadingIndicator();
          } else if (state is NewsLoaded) {
            return _buildNewsList(state.articles);
          } else if (state is NewsError) {
            return _buildErrorWidget(state.message);
          }
          return _buildInitialView();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<NewsBloc>().add(FetchNews()),
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildNewsList(List<Article> articles) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<NewsBloc>(context).add(FetchNews());
      },
      child: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) => _buildNewsItem(articles[index]),
      ),
    );
  }

  Widget _buildNewsItem(Article article) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _navigateToDetail(context, article),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (article.imageUrl != null) _buildNewsImage(article.imageUrl!),
              const SizedBox(height: 12),
              Text(
                article.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    DateFormat('yyyy-MM-dd - HH:mm').format(article.publishedAt),
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewsImage(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          height: 200,
          color: Colors.grey[200],
          child: const Center(child: CircularProgressIndicator()),
        ),
        errorWidget: (context, url, error) => Container(
          height: 200,
          color: Colors.grey[200],
          child: const Icon(Icons.error),
        ),
      ),
    );
  }

  Widget _buildErrorWidget(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            message,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.read<NewsBloc>().add(FetchNews()),
            child: const Text('إعادة المحاولة'),
          ),
        ],
      ),
    );
  }

  Widget _buildInitialView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.article, size: 48, color: Colors.blue),
          const SizedBox(height: 16),
          const Text(
            'مرحباً بكم في تطبيق الأخبار',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => context.read<NewsBloc>().add(FetchNews()),
            child: const Text('تحميل الأخبار'),
          ),
        ],
      ),
    );
  }

  void _navigateToDetail(BuildContext context, Article article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => NewsDetailPage(article: article),
      ),
    );
  }
}
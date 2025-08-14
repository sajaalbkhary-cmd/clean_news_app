// lib/features/news/presentation/pages/news_detail_page.dart
import 'package:flutter/material.dart';
import '../../domain/entities/article.dart';

class NewsDetailPage extends StatelessWidget {
  final Article article;

  const NewsDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (article.imageUrl != null)
                Image.network(article.imageUrl!),
              const SizedBox(height: 16),
              Text(
                article.content,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
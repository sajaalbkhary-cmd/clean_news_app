part of 'news_bloc.dart'; // تأكد من تطابق الاسم

abstract class NewsState {}

class NewsInitial extends NewsState {}
class NewsLoading extends NewsState {}
class NewsLoaded extends NewsState {
  final List<Article> articles;
  NewsLoaded({required this.articles});
}
class NewsError extends NewsState {
  final String message;
  NewsError({required this.message});
}
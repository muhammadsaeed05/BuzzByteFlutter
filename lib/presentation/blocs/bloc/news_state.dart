part of 'news_bloc.dart';

sealed class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsError extends NewsState {
  final AppErrorType appError;

  const NewsError(this.appError);

  @override
  List<Object> get props => [appError];
}

final class NewsLoaded extends NewsState {
  final List<ArticleEntity> articles;

  const NewsLoaded(this.articles);

  @override
  List<Object> get props => [articles];
}

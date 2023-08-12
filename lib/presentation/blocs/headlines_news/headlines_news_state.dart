part of 'headlines_news_bloc.dart';

sealed class HeadlinesNewsState extends Equatable {
  const HeadlinesNewsState();

  @override
  List<Object> get props => [];
}

final class HeadlinesNewsInitial extends HeadlinesNewsState {}

final class HeadlinesNewsLoading extends HeadlinesNewsState {}

final class HeadlinesNewsError extends HeadlinesNewsState {
  final AppErrorType appError;

  const HeadlinesNewsError(this.appError);

  @override
  List<Object> get props => [appError];
}

final class HeadlinesNewsLoaded extends HeadlinesNewsState {
  final List<ArticleEntity> articles;

  const HeadlinesNewsLoaded(this.articles);

  @override
  List<Object> get props => [articles];
}

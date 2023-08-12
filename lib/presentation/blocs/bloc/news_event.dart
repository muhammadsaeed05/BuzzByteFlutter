part of 'news_bloc.dart';

sealed class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class LoadNewsEvent extends NewsEvent {}

class LoadTopHeadlineNewsEvent extends NewsEvent {
  final String category;

  const LoadTopHeadlineNewsEvent(this.category);
}

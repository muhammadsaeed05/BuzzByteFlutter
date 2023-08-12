part of 'headlines_news_bloc.dart';

sealed class HeadlinesNewsEvent extends Equatable {
  const HeadlinesNewsEvent();

  @override
  List<Object> get props => [];
}

class LoadHeadlinesNewsEvent extends HeadlinesNewsEvent {
  final String category;

  const LoadHeadlinesNewsEvent(this.category);
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/domain/entities/app_error.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/usecases/get_everything_news.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetEverythingUseCase _getEverythingUseCase;

  NewsBloc(this._getEverythingUseCase) : super(NewsInitial()) {
    on<LoadNewsEvent>((event, emit) async {
      emit(NewsLoading());
      final either = await _getEverythingUseCase();
      either.fold(
          (l) => emit(NewsError(l.appErrorType)), (r) => emit(NewsLoaded(r)));
    });
  }
}

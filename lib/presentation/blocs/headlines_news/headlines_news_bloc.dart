import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/domain/entities/app_error.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/usecases/get_top_headlines.dart';

part 'headlines_news_event.dart';
part 'headlines_news_state.dart';

class HeadlinesNewsBloc extends Bloc<HeadlinesNewsEvent, HeadlinesNewsState> {
  final GetTopHeadlinesUsecase _getTopHeadlinesUsecase;

  HeadlinesNewsBloc(this._getTopHeadlinesUsecase)
      : super(HeadlinesNewsInitial()) {
    on<LoadHeadlinesNewsEvent>((event, emit) async {
      emit(HeadlinesNewsLoading());
      final either = await _getTopHeadlinesUsecase(event.category);
      either.fold((l) {
        emit(HeadlinesNewsError(l.appErrorType));
      }, (r) {
        print('hello');
        emit(HeadlinesNewsLoaded(r));
      });
    });
  }
}

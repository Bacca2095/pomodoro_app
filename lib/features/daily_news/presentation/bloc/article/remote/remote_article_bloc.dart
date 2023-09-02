import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_app/core/resources/data_state.dart';
import 'package:pomodoro_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:pomodoro_app/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:pomodoro_app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase)
      : super(const RemoteArticleLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase.call();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleDone(articles: dataState.data!));
    }

    if (dataState is DataFailed) {
      print(dataState.error);
      emit(RemoteArticleError(error: dataState.error!));
    }
  }
}

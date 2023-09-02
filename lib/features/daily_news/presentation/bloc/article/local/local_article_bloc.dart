import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_app/features/daily_news/domain/usecases/get_local_article.dart';
import 'package:pomodoro_app/features/daily_news/domain/usecases/remove_article.dart';
import 'package:pomodoro_app/features/daily_news/domain/usecases/save_article.dart';
import 'package:pomodoro_app/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:pomodoro_app/features/daily_news/presentation/bloc/article/local/local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetLocalArticleUseCase _getLocalArticleUseCase;
  final SaveLocalArticleUseCase _saveLocalArticleUseCase;
  final RemoveLocalArticleUseCase _removeLocalArticleUseCase;

  LocalArticleBloc(this._getLocalArticleUseCase, this._saveLocalArticleUseCase,
      this._removeLocalArticleUseCase)
      : super(const LocalArticleLoading()) {
    on<GetLocalArticleEvent>(onGetLocalArticle);
    on<SaveLocalArticleEvent>(onSaveLocalArticle);
    on<RemoveLocalArticleEvent>(onRemoveLocalArticle);
  }

  void onGetLocalArticle(
      GetLocalArticleEvent event, Emitter<LocalArticleState> emit) async {
    final articles = await _getLocalArticleUseCase.call();

    emit(LocalArticleDone(articles: articles));
  }

  void onRemoveLocalArticle(
      RemoveLocalArticleEvent event, Emitter<LocalArticleState> emit) async {
    await _removeLocalArticleUseCase.call(params: event.article!);
    final articles = await _getLocalArticleUseCase.call();
    emit(LocalArticleDone(articles: articles));
  }

  void onSaveLocalArticle(
      SaveLocalArticleEvent event, Emitter<LocalArticleState> emit) async {
    await _saveLocalArticleUseCase.call(params: event.article!);
    final articles = await _getLocalArticleUseCase.call();
    emit(LocalArticleDone(articles: articles));
  }
}

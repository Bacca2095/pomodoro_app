import 'package:pomodoro_app/core/resources/data_state.dart';
import 'package:pomodoro_app/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getArticles();

  Future<List<ArticleEntity>> getLocalArticles();

  Future<void> saveLocalArticle(ArticleEntity article);

  Future<void> removeLocalArticle(ArticleEntity article);
}

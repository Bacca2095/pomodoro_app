import 'package:pomodoro_app/core/resources/data_state.dart';
import 'package:pomodoro_app/core/usecases/usecase.dart';
import 'package:pomodoro_app/features/daily_news/domain/entities/article.dart';
import 'package:pomodoro_app/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository articleRepository;

  GetArticleUseCase(this.articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return articleRepository.getArticles();
  }
}

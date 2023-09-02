import 'package:pomodoro_app/core/usecases/usecase.dart';
import 'package:pomodoro_app/features/daily_news/domain/entities/article.dart';
import 'package:pomodoro_app/features/daily_news/domain/repository/article_repository.dart';

class RemoveLocalArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository articleRepository;

  RemoveLocalArticleUseCase(this.articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return articleRepository.removeLocalArticle(params!);
  }
}

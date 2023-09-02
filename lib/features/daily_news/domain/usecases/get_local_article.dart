import 'package:pomodoro_app/core/usecases/usecase.dart';
import 'package:pomodoro_app/features/daily_news/domain/entities/article.dart';
import 'package:pomodoro_app/features/daily_news/domain/repository/article_repository.dart';

class GetLocalArticleUseCase implements UseCase<List<ArticleEntity>, void> {
  final ArticleRepository articleRepository;

  GetLocalArticleUseCase(this.articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) {
    return articleRepository.getLocalArticles();
  }
}

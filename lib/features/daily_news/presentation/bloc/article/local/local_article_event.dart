import 'package:equatable/equatable.dart';
import 'package:pomodoro_app/features/daily_news/domain/entities/article.dart';

abstract class LocalArticleEvent extends Equatable {
  final ArticleEntity? article;
  const LocalArticleEvent({this.article});

  @override
  List<Object> get props => [article!];
}

class SaveLocalArticleEvent extends LocalArticleEvent {
  const SaveLocalArticleEvent({required ArticleEntity article})
      : super(article: article);
}

class RemoveLocalArticleEvent extends LocalArticleEvent {
  const RemoveLocalArticleEvent({required ArticleEntity article})
      : super(article: article);
}

class GetLocalArticleEvent extends LocalArticleEvent {
  const GetLocalArticleEvent();
}

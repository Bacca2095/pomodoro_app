import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pomodoro_app/core/constants/constants.dart';
import 'package:pomodoro_app/core/resources/data_state.dart';
import 'package:pomodoro_app/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:pomodoro_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:pomodoro_app/features/daily_news/data/models/article.dart';
import 'package:pomodoro_app/features/daily_news/domain/entities/article.dart';
import 'package:pomodoro_app/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;

  ArticleRepositoryImpl(this._newsApiService, this._appDatabase);
  @override
  Future<DataState<List<ArticleModel>>> getArticles() async {
    try {
      final httpResponse = await _newsApiService.getArticles(
        apiKey: newsAPIKey,
        country: country,
        category: category,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleEntity>> getLocalArticles() async {
    return _appDatabase.articleDao.getArticles();
  }

  @override
  Future<void> removeLocalArticle(ArticleEntity article) {
    return _appDatabase.articleDao
        .deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveLocalArticle(ArticleEntity article) {
    return _appDatabase.articleDao
        .insertArticle(ArticleModel.fromEntity(article));
  }
}

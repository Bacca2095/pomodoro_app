import 'package:dio/dio.dart';
import 'package:pomodoro_app/core/constants/constants.dart';
import 'package:pomodoro_app/features/daily_news/data/models/article.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getArticles(
      {@Query("apiKey") String? apiKey,
      @Query("country") String? country,
      @Query("category") String? category});
}
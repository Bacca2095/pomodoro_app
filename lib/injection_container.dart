import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pomodoro_app/features/auth/presentation/bloc/local/sign_in/sign_in_form_bloc.dart';
import 'package:pomodoro_app/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:pomodoro_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:pomodoro_app/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:pomodoro_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:pomodoro_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:pomodoro_app/features/daily_news/domain/usecases/get_local_article.dart';
import 'package:pomodoro_app/features/daily_news/domain/usecases/remove_article.dart';
import 'package:pomodoro_app/features/daily_news/domain/usecases/save_article.dart';
import 'package:pomodoro_app/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:pomodoro_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);
  sl.registerSingleton<Dio>(Dio());

  //Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));

  //Use cases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerSingleton<SaveLocalArticleUseCase>(SaveLocalArticleUseCase(sl()));
  sl.registerSingleton<GetLocalArticleUseCase>(GetLocalArticleUseCase(sl()));
  sl.registerSingleton<RemoveLocalArticleUseCase>(
      RemoveLocalArticleUseCase(sl()));

  //Bloc
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
  sl.registerFactory<LocalArticleBloc>(
      () => LocalArticleBloc(sl(), sl(), sl()));
  sl.registerFactory<SignInFormBloc>(() => SignInFormBloc());
}

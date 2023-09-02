import 'package:flutter/material.dart';
import 'package:pomodoro_app/features/auth/presentation/pages/sign_in/sign_in.dart';
import 'package:pomodoro_app/features/auth/presentation/pages/sign_up/sign_up.dart';
import 'package:pomodoro_app/features/daily_news/domain/entities/article.dart';
import 'package:pomodoro_app/features/daily_news/presentation/pages/article_detail/article_detail.dart';
import 'package:pomodoro_app/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:pomodoro_app/features/daily_news/presentation/pages/saved_article/saved_article.dart';
import 'package:pomodoro_app/features/profile/presentation/pages/home/profile.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const DailyNews());

      case '/SignIn':
        return _materialRoute(const SingIn());

      case '/SignUp':
        return _materialRoute(const SingUp());

      case '/ArticleDetails':
        return _materialRoute(
            ArticleDetailsView(article: settings.arguments as ArticleEntity));

      case '/Profile':
        return _materialRoute(const Profile());

      case '/SavedArticles':
        return _materialRoute(const SavedArticles());

      default:
        return _materialRoute(const DailyNews());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}

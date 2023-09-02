import 'package:floor/floor.dart';
import 'package:pomodoro_app/features/daily_news/data/models/article.dart';
import 'dao/article_dao.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDao;
}

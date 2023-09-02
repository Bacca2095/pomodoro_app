import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_app/config/routes/routes.dart';
import 'package:pomodoro_app/config/theme/app_themes.dart';
import 'package:pomodoro_app/features/auth/presentation/pages/sign_in/sign_in.dart';
import 'package:pomodoro_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:pomodoro_app/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:pomodoro_app/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  GestureBinding.instance.resamplingEnabled = true;
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pomodoro App',
        theme: theme(context),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: const SingIn(),
      ),
    );
  }
}

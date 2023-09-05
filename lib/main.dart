import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_app/config/routes/routes.dart';
import 'package:pomodoro_app/config/theme/app_themes.dart';
import 'package:pomodoro_app/features/auth/presentation/pages/sign_in/sign_in.dart';
import 'package:pomodoro_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:pomodoro_app/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:pomodoro_app/firebase_options.dart';
import 'package:pomodoro_app/injection_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: DynamicColorBuilder(
          builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          title: 'Pomodoro App',
          theme: theme(context, lightDynamic),
          darkTheme: theme(context, darkDynamic),
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const SingIn(),
        );
      }),
    );
  }
}

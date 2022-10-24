import 'package:clean_architecture_news_app_and_bloc/src/presentation/screen/breaking_news_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'src/config//routes/app_routes.dart';
// import 'src/config/themes/app_theme.dart';
import 'src/core/utils/constants.dart';
import 'src/injector.dart';
import 'src/presentation/blocs/remote_articles/remote_articles_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (_) => getIt()..add(const GetArticles()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kMaterialAppTitle,
        // theme: AppTheme.light,
        home: BreakingNewsScreen(),
      ),
    );
  }
}

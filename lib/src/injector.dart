import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/remote/news_api_service.dart';
import 'data/repositories/articles_repository_impl.dart';
import 'domain/repositories/article_repository.dart';
import 'domain/usecases/get_articles_usecase.dart';
import 'presentation/blocs/remote_articles/remote_articles_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerSingleton<Dio>(Dio());
  injector.registerSingleton<NewsApiService>(NewsApiService(injector()));
  injector
      .registerSingleton<ArticleRepository>(ArticlesRepositoryImpl(injector()));

  injector
      .registerSingleton<GetArticlesUsecase>(GetArticlesUsecase(injector()));
  injector.registerFactory<RemoteArticlesBloc>(
      () => RemoteArticlesBloc(injector()));
}

// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/remote/news_api_service.dart';
import 'data/repositories/articles_repository_impl.dart';
import 'domain/repositories/article_repository.dart';
import 'domain/usecases/get_articles_usecase.dart';
import 'presentation/blocs/remote_articles/remote_articles_bloc.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<NewsApiService>(NewsApiService(getIt()));
  getIt.registerSingleton<ArticleRepository>(ArticlesRepositoryImpl(getIt()));

  getIt.registerSingleton<GetArticlesUsecase>(GetArticlesUsecase(getIt()));

  getIt.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(getIt()));
}

import 'package:clean_architecture_news_app_and_bloc/src/core/params/article_request.dart';
import 'package:clean_architecture_news_app_and_bloc/src/core/resources/data_state.dart';
import 'package:clean_architecture_news_app_and_bloc/src/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<Article>>> getBreakingNewsArticles(
    ArticleRequestParams params,
  );
}

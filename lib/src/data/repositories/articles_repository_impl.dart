import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

import '../../domain/entities/article.dart';
import '../../core/resources/data_state.dart';
import '../../core/params/article_request.dart';
import '../../domain/repositories/article_repository.dart';
import '../datasources/remote/news_api_service.dart';

class ArticlesRepositoryImpl implements ArticleRepository {
  const ArticlesRepositoryImpl(this._newsApiService);

  final NewsApiService _newsApiService;

  @override
  Future<DataState<List<Article>>> getBreakingNewsArticles(
      ArticleRequestParams params) async {
    try {
      final httpResponse = await _newsApiService.getBreaKingNewsArticles(
          apiKey: params.apiKey,
          country: params.country,
          category: params.category,
          page: params.page,
          pageSize: params.pageSize);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSucess(httpResponse.data.articles);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.other,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}

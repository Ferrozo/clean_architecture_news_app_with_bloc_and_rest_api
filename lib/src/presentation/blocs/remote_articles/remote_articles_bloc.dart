// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'dart:async';
import '../../../domain/entities/article.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/bloc/bloc_with_state.dart';
import '../../../core/params/article_request.dart';
import '../../../domain/usecases/get_articles_usecase.dart';

part 'remote_articles_event.dart';
part 'remote_articles_state.dart';

class RemoteArticlesBloc
    extends BlocWithState<RemoteArticlesEvent, RemoteArticlesState> {
  final GetArticlesUsecase _getArticlesUseCase;

  RemoteArticlesBloc(this._getArticlesUseCase)
      : super(const RemoteArticlesLoading());

  final List<Article> _articles = [];
  int _page = 1;
  static const int _pageSize = 20;

  Stream<RemoteArticlesState> mapEventToState(
      RemoteArticlesEvent event) async* {
    if (event is GetArticles) yield* _getBreakingNewsArticle(event);
  }

  Stream<RemoteArticlesState> _getBreakingNewsArticle(
      RemoteArticlesEvent event) async* {
    yield* runBlocProcess(() async* {
      final dataState =
          await _getArticlesUseCase(params: ArticleRequestParams(page: _page));

      if (dataState is DataSucess && dataState.data!.isNotEmpty) {
        final articles = dataState.data;
        final noMoreData = articles!.length < _pageSize;
        _articles.addAll(articles);
        _page++;

        yield RemoteArticlesDone(_articles, noMoreData: noMoreData);
      }
      if (dataState is DataFailed) {
        yield RemoteArticlesError(dataState.error as DioError);
      }
    });
  }
}

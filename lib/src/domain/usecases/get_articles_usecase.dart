import '../../core/params/article_request.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecase/usecase.dart';
import '../entities/article.dart';
import '../repositories//article_repository.dart';

class GetArticlesUsecase
    implements UseCase<DataState<List<Article>>, ArticleRequestParams> {
  GetArticlesUsecase(this._articleRepository);
  final ArticleRepository _articleRepository;

  @override
  Future<DataState<List<Article>>> call({ArticleRequestParams? params}) {
    return _articleRepository.getBreakingNewsArticles(params!);
  }
}

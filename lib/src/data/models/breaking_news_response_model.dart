import 'article_model.dart';

class BreakingNewsResponseModel {
  BreakingNewsResponseModel(
      {required this.status, this.totalResults, required this.articles});
  final String status;
  final int? totalResults;
  final List<ArticleModel> articles;

  factory BreakingNewsResponseModel.fromJson(Map<String, dynamic> json) {
    return BreakingNewsResponseModel(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int,
      articles: List<ArticleModel>.from(
        (json['articles'] as List<dynamic>).map(
          (e) => ArticleModel.fromJson(e as Map<String, dynamic>),
        ),
      ),
    );
  }
}

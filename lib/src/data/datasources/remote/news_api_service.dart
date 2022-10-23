// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../models/breaking_news_response_model.dart';
import '../../../core/utils/constants.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio, {String baseUrl}) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<BreakingNewsResponseModel>> getBreaKingNewsArticles({
    @Query('apiKey') String? apiKey,
    @Query('country') String? country,
    @Query('category') String? category,
    @Query('page') int? page,
    @Query('pageSize') int? pageSize,
  });
}

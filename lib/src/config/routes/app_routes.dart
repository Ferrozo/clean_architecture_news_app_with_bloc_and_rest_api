import 'package:flutter/material.dart';

import '../../domain/entities/article.dart';
import '../../presentation/screen/article_details_view.dart';
import '../../presentation/screen/breaking_news_screen.dart';
import '../../presentation/screen/saved_articles_view.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const BreakingNewsScreen());
        break;

      case '/ArticleDetailsView':
        return _materialRoute(
            ArticleDetailsView(article: settings.arguments as Article));
        break;

      case '/saved_articles_view':
        return _materialRoute(const SavedArticlesView());
        break;
      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}

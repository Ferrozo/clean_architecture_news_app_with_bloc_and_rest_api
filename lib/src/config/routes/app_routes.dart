import 'package:flutter/material.dart';
import 'package:clean_architecture_news_app_and_bloc/src/presentation/screen/breaking_news_screen.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    return _materialRoute(const BreakingNewsScreen());
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}

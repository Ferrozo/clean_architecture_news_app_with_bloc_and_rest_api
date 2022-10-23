import 'package:equatable/equatable.dart';
import './source.dart';

class Article extends Equatable {
  const Article({
    required this.id,
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlImage,
    required this.publishedAt,
    required this.content,
  });

  final int id;
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlImage;
  final String publishedAt;
  final String content;

  @override
  List<Object?> get props => [
        id,
        source,
        author,
        title,
        title,
        description,
        url,
        urlImage,
        publishedAt,
        content
      ];

  @override
  bool get stringify => true;
}

import 'dart:math';

import 'package:cash_manager/domain/article/article.dart';
import 'package:cash_manager/domain/article/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'article_dto.freezed.dart';
part 'article_dto.g.dart';
@freezed
abstract class ArticleDto implements _$ArticleDto {
  ArticleDto._();
  @HiveType(typeId: 0)
  factory ArticleDto({
    @HiveField(3)
    required String image,
    @HiveField(2)
    required String body,
    @HiveField(1)
    required String name,
    @HiveField(0)
    required DateTime date,
  }) = _ArticleDto;

  factory ArticleDto.fromDomain(Article article) =>
      ArticleDto(name:article.name.getOrCrash(),
          body:article.body.getOrCrash(),image: article.image, date: article.date);
  Article toDomain() {
    return Article(name: ArticleName(name),body: ArticleBody(body),image:image,date: date);
  }
}
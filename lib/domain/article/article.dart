import 'package:cash_manager/domain/article/value_objects.dart';
import 'package:cash_manager/domain/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';

@freezed
abstract class Article implements _$Article {
  Article._();
  factory Article({
    required String uid,
    required ArticleName name,
    required ArticleBody body,
    required String image,
    @Default(false)bool isFav,
    required DateTime date,
  }) = _Article;
Option<ValueFailure<dynamic>> get failureOption {
  return name.failureOrUnit.andThen(body.failureOrUnit)
      .fold((l) => some(l), (r) => none());
}
}

import 'package:cash_manager/domain/core/failures.dart';
import 'package:cash_manager/domain/core/value_objects.dart';
import 'package:cash_manager/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
class ArticleName extends ValueObject<String>{
  @override
  final Either<ValueFailure<String>, String>  value;
  factory ArticleName(String input){
    return ArticleName._(validateStringNotEmpty(input).andThen(validateMaxStringLength(input, 150)));
  }
  const ArticleName._(this.value);
}
class ArticleBody extends ValueObject<String>{
  @override
  final Either<ValueFailure<String>, String>  value;
  factory ArticleBody(String input){
    return ArticleBody._(validateStringNotEmpty(input).andThen(validateMaxStringLength(input, 3000)));
  }
  const ArticleBody._(this.value);
}

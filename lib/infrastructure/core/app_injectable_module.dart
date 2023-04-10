import 'package:cash_manager/infrastructure/article/article_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@Scope(Environment.prod)
@module
abstract class AppInjectableProdModule {
  @lazySingleton
  http.Client get httpClient => http.Client();
  @preResolve
  @Named("article")
  Future<Box<ArticleDto>> get articleBox =>
      Hive.openBox("article");
}

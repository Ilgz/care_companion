import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@Scope(Environment.prod)
@module
abstract class AppInjectableProdModule {
  @lazySingleton
  http.Client get httpClient => http.Client();
  @preResolve
  @Named("favArticleUidBox")
  Future<Box<String>> get favArticleBox =>
      Hive.openBox("favArticleUid");
}

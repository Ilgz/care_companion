import 'package:cash_manager/domain/article/article.dart';
import 'package:cash_manager/domain/article/article_failure.dart';
import 'package:dartz/dartz.dart';
abstract class IArticleRepository{
  Future<Either<ArticleFailure,List<Article>>> getArticles();
  Future<Either<ArticleFailure,List<String>>> getFavoriteArticles();
  Future<Either<ArticleFailure, Unit>>createFavoriteArticles(Article article);
  Future<Either<ArticleFailure, Unit>>deleteFavoriteArticles(Article article);
  //Search
  Future<Either<ArticleFailure, List<Article>>> searchArticles(String searchTerm,List<Article> articles);
  Future<Either<ArticleFailure, List<String>>> getSearchHistory();
  Future<Either<ArticleFailure, Unit>> addSearchHistory(String searchTerm);
  Future<Either<ArticleFailure, Unit>> deleteSearchHistory(String searchTerm);
  Future<Either<ArticleFailure, Unit>> clearSearchHistory();
}
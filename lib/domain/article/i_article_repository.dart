import 'package:cash_manager/domain/article/article.dart';
import 'package:cash_manager/domain/article/article_failure.dart';
import 'package:dartz/dartz.dart';
abstract class IArticleRepository{
  Future<Either<ArticleFailure,List<Article>>> getArticles();
  Future<Either<ArticleFailure,List<Article>>> getFavoriteArticles();
  Future<Either<ArticleFailure, Unit>>createFavoriteArticles(Article article);
  Future<Either<ArticleFailure, Unit>>deleteFavoriteArticles(Article article);
}
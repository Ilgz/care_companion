import 'package:cash_manager/domain/article/article.dart';
import 'package:cash_manager/domain/article/article_failure.dart';
import 'package:cash_manager/domain/article/i_article_repository.dart';
import 'package:cash_manager/domain/article/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IArticleRepository)
class ArticleRepository implements IArticleRepository {
  final Box<String> _favArticleBox;
  final Box<String> _searchHistoryBox;
  ArticleRepository(@Named("favArticleUidBox") this._favArticleBox,@Named("searchHistoryBox") this._searchHistoryBox);

  @override
  Future<Either<ArticleFailure, Unit>> createFavoriteArticles(
      Article article) async {
    try {
      final favoritesEither = await getFavoriteArticles();
      return favoritesEither.fold((failure) {
        return left(failure);
      }, (favorites) async {
        if (!favorites.contains(article.uid)) {
          await _favArticleBox.add(article.uid);
        }
        return right(unit);
      });
    } on HiveError catch (e) {
      return left(const ArticleFailure.unexpected());
    }
  }

  @override
  Future<Either<ArticleFailure, Unit>> deleteFavoriteArticles(
      Article article) async {
    try {
      final favoritesEither = await getFavoriteArticles();
      return favoritesEither.fold((failure) {
        return left(failure);
      }, (favorites) async {
        int index =
        favorites.indexWhere((e) => e == article.uid);
        if (index == -1) {
          return left(const ArticleFailure.unexpected());
        }
        await _favArticleBox.deleteAt(index);
        return right(unit);
      });
    } on HiveError catch (e) {
      return left(const ArticleFailure.unexpected());
    }
  }

  @override
  Future<Either<ArticleFailure, List<Article>>> getArticles() async {
   return right([]);
  }

  @override
  Future<Either<ArticleFailure, List<String>>> getFavoriteArticles() async {
    final articles =
        _favArticleBox.values.toList();
    return right(articles);
  }

  @override
  Future<Either<ArticleFailure, List<String>>> getSearchHistory() async {
    try {
      final searchHistory = _searchHistoryBox.values.toList();
      return right(searchHistory);
    } on HiveError catch (_) {
      return left(const ArticleFailure.unexpected());
    }
  }

  @override
  Future<Either<ArticleFailure, Unit>> addSearchHistory(String searchTerm) async {
    try {
      if (!_searchHistoryBox.values.contains(searchTerm)) {
        await _searchHistoryBox.add(searchTerm);
      }
      return right(unit);
    } on HiveError catch (_) {
      return left(const ArticleFailure.unexpected());
    }
  }

  @override
  Future<Either<ArticleFailure, Unit>> deleteSearchHistory(String searchTerm) async {
    try {
      int index = _searchHistoryBox.values.toList().indexWhere((e) => e == searchTerm);
      if (index == -1) {
        return left(const ArticleFailure.unexpected());
      }
      await _searchHistoryBox.deleteAt(index);
      return right(unit);
    } on HiveError catch (_) {
      return left(const ArticleFailure.unexpected());
    }
  }
  @override
  Future<Either<ArticleFailure, Unit>> clearSearchHistory() async {
    try {
      await _searchHistoryBox.clear();
      return right(unit);
    } on HiveError catch (_) {
      return left(const ArticleFailure.unexpected());
    }
  }
}

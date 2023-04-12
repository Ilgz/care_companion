import 'package:cash_manager/domain/article/article.dart';
import 'package:cash_manager/domain/article/article_failure.dart';
import 'package:cash_manager/domain/article/value_objects.dart';
import 'package:cash_manager/infrastructure/article/article_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_test/hive_test.dart';

import '../../fixtures/faker.dart';

void main() async {
  late Box<String> favArticleBox;
  late Box<String> searchHistoryBox;
  late ArticleRepository articleRepository;
  late Article article;
  setUp(() async {
    await setUpTestHive();
    favArticleBox = await Hive.openBox("favArticleUid");
    searchHistoryBox = await Hive.openBox("searchHistory");
    articleRepository = ArticleRepository(favArticleBox,searchHistoryBox);
    article=  Article(uid: getRandomName(), name: ArticleName(getRandomName()),body: ArticleBody(getRandomName()),date: DateTime.now(), image: getRandomName());
  });
  tearDown(() async {
    await favArticleBox.clear();
  });
  group("GetFavArticles", () {
    test(
      "should return a list of favorite articles when the response code is 200 (success)",
          () async {
        final List<String> favArticleIds = [getRandomName(), getRandomName(), getRandomName()];
        for (var id in favArticleIds) {
          favArticleBox.add(id);
        }
        final favArticleList = await articleRepository.getFavoriteArticles();
        expect(favArticleList.getOrElse(() => []), favArticleIds);
      },
    );
  });
  test(
    "should return an empty list when there are no favorite articles",
        () async {
      final favArticleList = await articleRepository.getFavoriteArticles();
      expect(favArticleList.getOrElse(() => []), []);
    },
  );
  group("CreateFavArticles", () {
    test(
      "should add a new favorite article when it doesn't already exist in the list",
          () async {
        await articleRepository.createFavoriteArticles(article);

        final favArticleList = await articleRepository.getFavoriteArticles();
        expect(favArticleList.getOrElse(() => []), [article.uid]);
      },
    );

    test(
      "should not add a duplicate favorite article when it already exists in the list",
          () async {
        await articleRepository.createFavoriteArticles(article);
        await articleRepository.createFavoriteArticles(article);
        final favArticleList = await articleRepository.getFavoriteArticles();
        expect(favArticleList.getOrElse(() => []), [article.uid]);
      },
    );
  });
  group("DeleteFavArticles", () {
    test(
      "should delete a favorite article when it exists in the list",
          () async {
        await favArticleBox.add(article.uid);

        await articleRepository.deleteFavoriteArticles(article);

        final favArticleList = await articleRepository.getFavoriteArticles();
        expect(favArticleList.getOrElse(() => []), []);
      },
    );

    test(
      "should return an ArticleFailure.unexpected() when the article to be deleted does not exist in the list",
          () async {
        final result = await articleRepository.deleteFavoriteArticles(article);
        expect(result, left(const ArticleFailure.unexpected()));
      },
    );
  });
}

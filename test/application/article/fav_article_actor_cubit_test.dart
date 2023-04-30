import 'package:bloc_test/bloc_test.dart';
import 'package:cash_manager/application/article/fav_article_actor/fav_article_actor_cubit.dart';
import 'package:cash_manager/domain/article/article.dart';
import 'package:cash_manager/domain/article/article_failure.dart';
import 'package:cash_manager/domain/article/i_article_repository.dart';
import 'package:cash_manager/domain/article/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockArticleRepository extends Mock implements IArticleRepository {}

void main() {
  late MockArticleRepository mockArticleRepository;
  late Article testArticle;

  setUp(() {
    mockArticleRepository = MockArticleRepository();
    testArticle = Article(
      uid: 'testUid',
      name: ArticleName('Test Article'),
      body: ArticleBody('Test Article Body'),
      date: DateTime.now(),
      image: 'Test Image',
    );
  });

  group('FavArticleActorCubit', () {
    blocTest<FavArticleActorCubit, FavArticleActorState>(
      'emits [loadInProgress, deleteFavArticleSuccess] when deleteFavArticle is called successfully',
      build: () {
        when(() => mockArticleRepository.deleteFavoriteArticles(testArticle))
            .thenAnswer((_) async => const Right(unit));
        return FavArticleActorCubit(mockArticleRepository);
      },
      act: (cubit) => cubit.deleteFavArticle(testArticle),
      expect: () => [
        const FavArticleActorState.loadInProgress(),
        const FavArticleActorState.deleteFavArticleSuccess(),
      ],
    );

    blocTest<FavArticleActorCubit, FavArticleActorState>(
      'emits [loadInProgress, deleteFavArticleFailure] when deleteFavArticle fails',
      build: () {
        when(() => mockArticleRepository.deleteFavoriteArticles(testArticle))
            .thenAnswer((_) async => const Left(ArticleFailure.unexpected()));
        return FavArticleActorCubit(mockArticleRepository);
      },
      act: (cubit) => cubit.deleteFavArticle(testArticle),
      expect: () => [
        const FavArticleActorState.loadInProgress(),
        FavArticleActorState.deleteFavArticleFailure(const ArticleFailure.unexpected()),
      ],
    );

    blocTest<FavArticleActorCubit, FavArticleActorState>(
      'emits [loadInProgress, createFavArticleSuccess] when createFavArticle is called successfully',
      build: () {
        when(() => mockArticleRepository.createFavoriteArticles(testArticle))
            .thenAnswer((_) async => const Right(unit));
        return FavArticleActorCubit(mockArticleRepository);
      },
      act: (cubit) => cubit.createFavArticle(testArticle),
      expect: () => [
        const FavArticleActorState.loadInProgress(),
        const FavArticleActorState.createFavArticleSuccess(),
      ],
    );

    blocTest<FavArticleActorCubit, FavArticleActorState>(
      'emits [loadInProgress, createFavArticleFailure] when createFavArticle fails',
      build: () {
        when(() => mockArticleRepository.createFavoriteArticles(testArticle))
            .thenAnswer((_) async => const Left(ArticleFailure.unexpected()));
        return FavArticleActorCubit(mockArticleRepository);
      },
      act: (cubit) => cubit.createFavArticle(testArticle),
      expect: () => [
        const FavArticleActorState.loadInProgress(),
        FavArticleActorState.createFavArticleFailure(const ArticleFailure.unexpected()),
      ],
    );
  });
}

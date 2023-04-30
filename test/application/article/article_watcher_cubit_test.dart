import 'package:bloc_test/bloc_test.dart';
import 'package:cash_manager/application/article/fav_article_watcher/fav_article_watcher_cubit.dart';
import 'package:cash_manager/domain/article/article.dart';
import 'package:cash_manager/domain/article/article_failure.dart';
import 'package:cash_manager/domain/article/i_article_repository.dart';
import 'package:cash_manager/application/article/article_watcher/article_watcher_cubit.dart';
import 'package:cash_manager/domain/article/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures/faker.dart';

class MockArticleRepository extends Mock implements IArticleRepository {}

class MockFavArticleCubit extends Mock implements FavArticleWatcherCubit {}

void main() {
  late ArticleWatcherCubit articleWatcherCubit;
  late IArticleRepository articleRepository;
  late FavArticleWatcherCubit favArticleCubit;

  setUp(() {
    articleRepository = MockArticleRepository();
    favArticleCubit = MockFavArticleCubit();
    articleWatcherCubit = ArticleWatcherCubit(articleRepository, favArticleCubit);
  });

  tearDown(() {
    articleWatcherCubit.close();
  });

  group('ArticleWatcherCubit', () {
    test('initial state is ArticleWatcherState.initial()', () {
      expect(articleWatcherCubit.state, const ArticleWatcherState.initial());
    });

    blocTest<ArticleWatcherCubit, ArticleWatcherState>(
      'emits [ArticleWatcherState.loadInProgress(), ArticleWatcherState.loadSuccess()] when getArticles succeeds',
      build: () {
        final List<Article> articles = [
          Article(
            uid: getRandomName(),
            name: ArticleName(getRandomName()),
            body: ArticleBody(getRandomName()),
            date: DateTime.now(),
            image: getRandomName(),
          ),
        ];
        when(() => articleRepository.getArticles()).thenAnswer((_) async => Right(articles));
        when(() => favArticleCubit.state).thenReturn(const FavArticleWatcherState.loadSuccess([]));
        return articleWatcherCubit;
      },
      act: (cubit) => cubit.getArticles(),
      expect: () => [
        const ArticleWatcherState.loadInProgress(),
        isA<ArticleWatcherState>(),
      ],
      verify: (cubit) {
        final currentState = cubit.state;
        expect(currentState, isA<ArticleWatcherState>());
        expect(currentState.maybeMap(loadSuccess: (state)=>state.articles.length,orElse: ()=>-1), 1);
      },
    );

    blocTest<ArticleWatcherCubit, ArticleWatcherState>(
      'emits [ArticleWatcherState.loadInProgress(), ArticleWatcherState.loadFailure()] when getArticles fails',
      build: () {
        when(() => articleRepository.getArticles()).thenAnswer((_) async => Left(ArticleFailure.unexpected()));
        when(() => favArticleCubit.state).thenReturn(const FavArticleWatcherState.loadSuccess([]));
        return articleWatcherCubit;
      },
      act: (cubit) => cubit.getArticles(),
      expect: () => [
        const ArticleWatcherState.loadInProgress(),
        const ArticleWatcherState.loadFailure(ArticleFailure.unexpected()),
      ],
    );
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:cash_manager/application/article/article_searcher/article_searcher_cubit.dart';
import 'package:cash_manager/domain/article/i_article_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures/faker.dart';

class MockArticleRepository extends Mock implements IArticleRepository {}

void main() {
  late ArticleSearcherCubit articleSearcherCubit;
  late IArticleRepository articleRepository;

  setUp(() {
    articleRepository = MockArticleRepository();
    articleSearcherCubit = ArticleSearcherCubit(articleRepository);
  });

  tearDown(() {
    articleSearcherCubit.close();
  });

  group('ArticleSearcherCubit', () {
    test('initial state is ArticleSearcherState.initial()', () {
      expect(articleSearcherCubit.state, const ArticleSearcherState.initial());
    });

    // Test for loadSearchHistory
    blocTest<ArticleSearcherCubit, ArticleSearcherState>(
      'emits [ArticleSearcherState.loading(), ArticleSearcherState.searchHistoryLoaded()] when loadSearchHistory succeeds',
      build: () {
        final List<String> searchHistory = [getRandomName(), getRandomName()];
        when(() => articleRepository.getSearchHistory())
            .thenAnswer((_) async => Right(searchHistory));
        return articleSearcherCubit;
      },
      act: (cubit) => cubit.loadSearchHistory(),
      expect: () => [
        const ArticleSearcherState.loading(),
        isA<ArticleSearcherState>(),
      ],
      verify: (cubit) {
        final currentState = cubit.state;
        expect(currentState, isA<ArticleSearcherState>());
        expect(
            currentState.maybeMap(
              searchHistoryLoaded: (state) => state.searchHistory.length,
              orElse: () => -1,
            ),
            2);
      },
    );

    // Test for addSearchHistory
    blocTest<ArticleSearcherCubit, ArticleSearcherState>(
      'emits nothing when addSearchHistory succeeds',
      build: () {
        when(() => articleRepository.addSearchHistory(any()))
            .thenAnswer((_) async => const Right(unit));
        return articleSearcherCubit;
      },
      act: (cubit) => cubit.addSearchHistory("test"),
      expect: () => [],
    );

    // Test for deleteSearchHistory
    blocTest<ArticleSearcherCubit, ArticleSearcherState>(
      'emits nothing when deleteSearchHistory succeeds',
      build: () {
        when(() => articleRepository.deleteSearchHistory(any()))
            .thenAnswer((_) async => const Right(unit));
        return articleSearcherCubit;
      },
      act: (cubit) => cubit.deleteSearchHistory("test"),
      expect: () => [],
    );

    // Test for clearSearchHistory
    blocTest<ArticleSearcherCubit, ArticleSearcherState>(
      'emits [ArticleSearcherState.loading(), ArticleSearcherState.searchHistoryLoaded()] when clearSearchHistory succeeds',
      build: () {
        when(() => articleRepository.clearSearchHistory())
            .thenAnswer((_) async => const Right(unit));
        when(() => articleRepository.getSearchHistory())
            .thenAnswer((_) async => Right([]));
        return articleSearcherCubit;
      },
      act: (cubit) => cubit.clearSearchHistory(),
      expect: () => [
        const ArticleSearcherState.loading(),
        isA<ArticleSearcherState>(),
      ],
      verify: (cubit) {
        final currentState = cubit.state;
        expect(currentState, isA<ArticleSearcherState>());
        expect(
            currentState.maybeMap(
              searchHistoryLoaded: (state) => state.searchHistory.length,
              orElse: () => -1,
            ),
            0);
      },
    );
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:cash_manager/application/article/fav_article_watcher/fav_article_watcher_cubit.dart';
import 'package:cash_manager/domain/article/article_failure.dart';
import 'package:cash_manager/domain/article/i_article_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockArticleRepository extends Mock implements IArticleRepository {}

void main() {
  late FavArticleWatcherCubit favArticleWatcherCubit;
  late IArticleRepository articleRepository;

  setUp(() {
    articleRepository = MockArticleRepository();
    favArticleWatcherCubit = FavArticleWatcherCubit(articleRepository);
  });

  tearDown(() {
    favArticleWatcherCubit.close();
  });

  group('FavArticleWatcherCubit', () {
    test('initial state is FavArticleWatcherState.initial()', () {
      expect(favArticleWatcherCubit.state, const FavArticleWatcherState.initial());
    });

    blocTest<FavArticleWatcherCubit, FavArticleWatcherState>(
      'emits [FavArticleWatcherState.loadInProgress(), FavArticleWatcherState.loadSuccess()] when getFavArticles succeeds',
      build: () {
        final List<String> articleIdList = ['1', '2', '3'];
        when(() => articleRepository.getFavoriteArticles()).thenAnswer((_) async => Right(articleIdList));
        return favArticleWatcherCubit;
      },
      act: (cubit) => cubit.getFavArticles(),
      expect: () => [
        const FavArticleWatcherState.loadInProgress(),
        isA<FavArticleWatcherState>(),
      ],
      verify: (cubit) {
        final currentState = cubit.state;
        expect(currentState, isA<FavArticleWatcherState>());
        expect(currentState.maybeMap(loadSuccess: (state) => state.articleIdList.length, orElse: () => -1), 3);
      },
    );

    blocTest<FavArticleWatcherCubit, FavArticleWatcherState>(
      'emits [FavArticleWatcherState.loadInProgress(), FavArticleWatcherState.loadFailure()] when getFavArticles fails',
      build: () {
        when(() => articleRepository.getFavoriteArticles()).thenAnswer((_) async => Left(ArticleFailure.unexpected()));
        return favArticleWatcherCubit;
      },
      act: (cubit) => cubit.getFavArticles(),
      expect: () => [
        const FavArticleWatcherState.loadInProgress(),
        const FavArticleWatcherState.loadFailure(ArticleFailure.unexpected()),
      ],
    );
  });
}

part of 'article_searcher_cubit.dart';

@freezed
class ArticleSearcherState with _$ArticleSearcherState {
  const factory ArticleSearcherState.initial() = _Initial;
  const factory ArticleSearcherState.loading() = _Loading;
  const factory ArticleSearcherState.loaded(List<Article> articles,String searchTerm) = _Loaded;
  const factory ArticleSearcherState.failure(ArticleFailure failure) = _Failure;

  // Add a new state for loaded search history
  const factory ArticleSearcherState.searchHistoryLoaded(List<String> searchHistory) = _SearchHistoryLoaded;
}
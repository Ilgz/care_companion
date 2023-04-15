import 'package:bloc/bloc.dart';
import 'package:cash_manager/domain/article/article.dart';
import 'package:cash_manager/domain/article/article_failure.dart';
import 'package:cash_manager/domain/article/i_article_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'article_searcher_cubit.freezed.dart';

part 'article_searcher_state.dart';
@injectable
class ArticleSearcherCubit extends Cubit<ArticleSearcherState> {
  final IArticleRepository _iArticleRepository;
  ArticleSearcherCubit(this._iArticleRepository)
      : super(const ArticleSearcherState.initial());
  Future<void> searchArticles(String searchTerm,List<Article> articles) async {
    addSearchHistory(searchTerm);
    emit(const ArticleSearcherState.loading());
    final searchResult = await _iArticleRepository.searchArticles(searchTerm,articles);
    searchResult.fold(
          (failure) => emit(ArticleSearcherState.failure(failure)),
          (searchResults) => emit(ArticleSearcherState.loaded(searchResults,searchTerm)),
    );
  }
  Future<void> loadSearchHistory() async {
    emit(const ArticleSearcherState.loading());
    final searchHistoryResult = await _iArticleRepository.getSearchHistory();
    searchHistoryResult.fold(
      (failure) => emit(ArticleSearcherState.failure(failure)),
      (searchHistory) =>
          emit(ArticleSearcherState.searchHistoryLoaded(searchHistory)),
    );
  }

  Future<void> addSearchHistory(String searchTerm) async {
    final result = await _iArticleRepository.addSearchHistory(searchTerm);
    result.fold(
      (failure) => emit(ArticleSearcherState.failure(failure)),
          (_){},
    );
  }

  Future<void> deleteSearchHistory(String searchTerm) async {
    final result = await _iArticleRepository.deleteSearchHistory(searchTerm);
    result.fold(
      (failure) => emit(ArticleSearcherState.failure(failure)),
      (_){},
    );
  }

  Future<void> clearSearchHistory() async {
    final result = await _iArticleRepository.clearSearchHistory();
    result.fold(
      (failure) => emit(ArticleSearcherState.failure(failure)),
      (_) => loadSearchHistory(),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:cash_manager/domain/article/article.dart';
import 'package:cash_manager/domain/article/article_failure.dart';
import 'package:cash_manager/domain/article/i_article_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'fav_article_watcher_state.dart';
part 'fav_article_watcher_cubit.freezed.dart';
@singleton
class FavArticleWatcherCubit extends Cubit<FavArticleWatcherState> {
  final IArticleRepository _articleRepository;
  FavArticleWatcherCubit(this._articleRepository) : super(const FavArticleWatcherState.initial());

  Future<void> getFavArticles() async {
    emit(const FavArticleWatcherState.loadInProgress());
    final articleIdListEither = await _articleRepository.getFavoriteArticles();
    emit(articleIdListEither.fold((f) => FavArticleWatcherState.loadFailure(f),
            (articles) => FavArticleWatcherState.loadSuccess(articles)));
  }

}

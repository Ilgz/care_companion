part of 'fav_article_watcher_cubit.dart';


@freezed
class FavArticleWatcherState with _$FavArticleWatcherState {
  const factory FavArticleWatcherState.initial() = _Initial;
  const factory FavArticleWatcherState.loadInProgress()=_LoadInProgress;
  const factory FavArticleWatcherState.loadSuccess(List<String> articleIdList)=_LoadSuccess;
  const factory FavArticleWatcherState.loadFailure(ArticleFailure articleFailure)=_LoadFailure;
}

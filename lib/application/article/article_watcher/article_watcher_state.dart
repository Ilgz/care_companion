part of 'article_watcher_cubit.dart';

@freezed
class ArticleWatcherState with _$ArticleWatcherState {
  const factory ArticleWatcherState.initial() = _Initial;
  const factory ArticleWatcherState.loadInProgress()=_LoadInProgress;
  const factory ArticleWatcherState.loadSuccess(List<Article> articles )=_LoadSuccess;
  const factory ArticleWatcherState.loadFailure(ArticleFailure articleFailure)=_LoadFailure;
}


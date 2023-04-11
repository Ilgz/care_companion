part of 'fav_article_cubit.dart';


@freezed
class FavArticleState with _$FavArticleState {
  const factory FavArticleState.initial() = _Initial;
  const factory FavArticleState.loadInProgress()=_LoadInProgress;
  const factory FavArticleState.loadSuccess(List<String> articleIdList)=_LoadSuccess;
  const factory FavArticleState.loadFailure(ArticleFailure articleFailure)=_LoadFailure;
}

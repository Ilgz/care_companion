part of 'fav_article_actor_cubit.dart';

@freezed
class FavArticleActorState with _$FavArticleActorState {
  const factory FavArticleActorState.initial() = _Initial;
  const factory FavArticleActorState.deleteFavArticleSuccess()=_DeleteFavArticleSuccess;
  const factory FavArticleActorState.deleteFavArticleFailure(ArticleFailure failureException)=_DeleteFavArticleFailure;
  const factory FavArticleActorState.createFavArticleSuccess()=_CreateFavArticleSuccess;
  const factory FavArticleActorState.createFavArticleFailure(ArticleFailure failureException)=_CreateFavArticleFailure;
}

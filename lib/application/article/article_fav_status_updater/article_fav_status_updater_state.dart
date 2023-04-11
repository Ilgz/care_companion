part of 'article_fav_status_updater_cubit.dart';

@freezed
class ArticleFavoriteStatusUpdaterState with _$ArticleFavoriteStatusUpdaterState {
  factory ArticleFavoriteStatusUpdaterState.initial() => ArticleFavoriteStatusUpdaterState(articles: [], favIdList: []);
  factory ArticleFavoriteStatusUpdaterState({required List<Article> articles,required List<String> favIdList})= _ArticleFavoriteStatusUpdaterState;
}

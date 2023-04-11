import 'package:bloc/bloc.dart';
import 'package:cash_manager/application/article/fav_article_watcher/fav_article_cubit.dart';
import 'package:cash_manager/domain/article/article.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'article_fav_status_updater_state.dart';

part 'article_fav_status_updater_cubit.freezed.dart';

@injectable
class ArticleFavoriteStatusUpdaterCubit extends Cubit<ArticleFavoriteStatusUpdaterState> {
  final FavArticleCubit favArticleCubit;
  ArticleFavoriteStatusUpdaterCubit(this.favArticleCubit)
      : super(ArticleFavoriteStatusUpdaterState.initial());
  void init() {
    emit(state.copyWith(favIdList: favArticleCubit.state.maybeMap(
        loadSuccess: (state) => state.articleIdList, orElse: () => [])));
    favArticleCubit.stream.listen((favArticleCubitState) {
      favArticleCubitState.maybeMap(loadSuccess: (successState) {
        emit(state.copyWith(favIdList: successState.articleIdList));
        updateArticleList(state.articles);
      }, orElse: () {});
    });
  }
  void updateArticleList(List<Article> articles) {
    emit(state.copyWith(articles: _markFavoriteArticles(articles)));
  }
  List<Article> _markFavoriteArticles(List<Article> articles) {
    List<Article> updatedArticles=[];
    for(int i=0;i<articles.length;i++){
      if(state.favIdList.contains(articles[i].uid)){
        updatedArticles.add(articles[i].copyWith(isFav:true));
      }else{
        updatedArticles.add(articles[i]);
      }
    }
    return updatedArticles;
  }
}

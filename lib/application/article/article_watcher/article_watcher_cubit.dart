import 'package:bloc/bloc.dart';
import 'package:cash_manager/application/article/fav_article_watcher/fav_article_watcher_cubit.dart';
import 'package:cash_manager/domain/article/article.dart';
import 'package:cash_manager/domain/article/article_failure.dart';
import 'package:cash_manager/domain/article/i_article_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'article_watcher_cubit.freezed.dart';

part 'article_watcher_state.dart';

@injectable
class ArticleWatcherCubit extends Cubit<ArticleWatcherState> {
  final IArticleRepository _articleRepository;
  final FavArticleWatcherCubit favArticleCubit;
  List<String> favArticleIdList=[];
  ArticleWatcherCubit(this._articleRepository,this.favArticleCubit)
      : super(const ArticleWatcherState.initial());
  void init() {
    favArticleCubit.stream.listen((favArticleCubitState) {
      favArticleCubitState.maybeMap(loadSuccess: (successState) {
        favArticleIdList=successState.articleIdList;
        getArticles();
      }, orElse: () {});
    });
  }
  Future<void> getArticles() async {
    emit(const ArticleWatcherState.loadInProgress());
    final articles = await _articleRepository.getArticles();
    emit(articles.fold((f) => ArticleWatcherState.loadFailure(f),
        (articles) => ArticleWatcherState.loadSuccess(_markFavoriteArticles(articles))));
  }
  List<Article> _markFavoriteArticles(List<Article> articles) {
    List<Article> updatedArticles=[];
    for(int i=0;i<articles.length;i++){
      if(favArticleIdList.contains(articles[i].uid)){
        updatedArticles.add(articles[i].copyWith(isFav:true));
      }else{
        updatedArticles.add(articles[i].copyWith(isFav:false));
      }
    }
    return updatedArticles;
  }
}

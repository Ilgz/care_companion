import 'package:bloc/bloc.dart';
import 'package:cash_manager/domain/article/article.dart';
import 'package:cash_manager/domain/article/article_failure.dart';
import 'package:cash_manager/domain/article/i_article_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'fav_article_actor_state.dart';
part 'fav_article_actor_cubit.freezed.dart';
@injectable
class FavArticleActorCubit extends Cubit<FavArticleActorState> {
  final IArticleRepository _articleRepository;
  FavArticleActorCubit(this._articleRepository) : super(const FavArticleActorState.initial());
  deleteArticle(Article article)async{
    final failureOrSuccess =
    await _articleRepository.deleteFavoriteArticles(article);
      emit(failureOrSuccess.fold(
              (f) => FavArticleActorState.deleteFavArticleFailure(f),
              (_) => const FavArticleActorState.createFavArticleSuccess()));
  }
  createArticle(Article article)async{
    final failureOrSuccess =
    await _articleRepository.createFavoriteArticles(article);
    emit(failureOrSuccess.fold(
            (f) => FavArticleActorState.createFavArticleFailure(f),
            (_) => const FavArticleActorState.createFavArticleSuccess()));
  }
}

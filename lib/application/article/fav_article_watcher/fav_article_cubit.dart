import 'package:bloc/bloc.dart';
import 'package:cash_manager/domain/article/article.dart';
import 'package:cash_manager/domain/article/article_failure.dart';
import 'package:cash_manager/domain/article/i_article_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'fav_article_state.dart';
part 'fav_article_cubit.freezed.dart';
@singleton
class FavArticleCubit extends Cubit<FavArticleState> {
  final IArticleRepository _articleRepository;
  FavArticleCubit(this._articleRepository) : super(const FavArticleState.initial());

  Future<void> getFavArticles() async {
    emit(const FavArticleState.loadInProgress());
    final articleIdListEither = await _articleRepository.getFavoriteArticles();
    emit(articleIdListEither.fold((f) => FavArticleState.loadFailure(f),
            (articles) => FavArticleState.loadSuccess(articles)));
  }

}

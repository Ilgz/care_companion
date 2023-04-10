import 'package:bloc/bloc.dart';
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

  ArticleWatcherCubit(this._articleRepository)
      : super(const ArticleWatcherState.initial());

  void getArticles() async {
    emit(const ArticleWatcherState.loadInProgress());
    final articles = await _articleRepository.getArticles();
    emit(articles.fold((f) => ArticleWatcherState.loadFailure(f),
        (articles) => ArticleWatcherState.loadSuccess(articles)));
  }
}

import 'package:cash_manager/application/article/article_fav_status_updater/article_fav_status_updater_cubit.dart';
import 'package:cash_manager/application/article/article_watcher/article_watcher_cubit.dart';
import 'package:cash_manager/application/article/fav_article_actor/fav_article_actor_cubit.dart';
import 'package:cash_manager/application/article/fav_article_watcher/fav_article_cubit.dart';
import 'package:cash_manager/injection.dart';
import 'package:cash_manager/presentation/core/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ArticleWatcherCubit>()..getArticles(),
        ),
        BlocProvider(
          create: (context) =>
              getIt<ArticleFavoriteStatusUpdaterCubit>()..init(),
        ),
        BlocProvider(
            create: (context) => getIt<FavArticleCubit>()..getFavArticles(),
            lazy: false),
        BlocProvider(
          create: (context) => getIt<FavArticleActorCubit>(),
        ),
      ],
      child: Builder(builder: (context) {
        return BlocListener<FavArticleActorCubit, FavArticleActorState>(
          listenWhen: (p, c) {
            return true;
          },
          listener: (context, state) {
            state.map(
                initial: (_) {},
                deleteFavArticleSuccess: (state) {
                  context.read<FavArticleCubit>().getFavArticles();
                },
                deleteFavArticleFailure: (state) {
                  //TODO notify user about deleteFavArticleFailure
                },
                createFavArticleSuccess: (state) {
                  context.read<FavArticleCubit>().getFavArticles();
                },
                createFavArticleFailure: (state) {
                  //TODO notify user about createFavArticleFailure
                },
                loadInProgress: (_) {
                });
          },
          child: MaterialApp.router(
            routerConfig: goRouter,
            title: "Care Companion",
            debugShowCheckedModeBanner: false,
          ),
        );
      }),
    );
  }
}

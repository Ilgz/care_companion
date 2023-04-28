import 'package:cash_manager/application/article/article_searcher/article_searcher_cubit.dart';
import 'package:cash_manager/application/article/article_watcher/article_watcher_cubit.dart';
import 'package:cash_manager/application/article/fav_article_actor/fav_article_actor_cubit.dart';
import 'package:cash_manager/application/article/fav_article_watcher/fav_article_cubit.dart';
import 'package:cash_manager/application/intro/intro_cubit.dart';
import 'package:cash_manager/application/milestone/milestone_actor/milestone_actor_cubit.dart';
import 'package:cash_manager/application/milestone/milestone_filter/milestone_filter_cubit.dart';
import 'package:cash_manager/application/milestone/milestone_watcher/milestone_watcher_cubit.dart';
import 'package:cash_manager/application/tracker/tracker_watcher/tracker_watcher_cubit.dart';
import 'package:cash_manager/application/tracker/unit_preference_actor/unit_preference_actor_cubit.dart';
import 'package:cash_manager/application/tracker/unit_preference_watcher/unit_preference_watcher_cubit.dart';
import 'package:cash_manager/injection.dart';
import 'package:cash_manager/presentation/core/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<MilestoneWatcherCubit>()..getMilestones(),
        ),
        BlocProvider(
          create: (context) => getIt<MilestoneFilterCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<MilestoneActorCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ArticleWatcherCubit>()
            ..init()
            ..getArticles(),
        ),
        BlocProvider(
            create: (context) => getIt<FavArticleCubit>()..getFavArticles(),
            lazy: false),
        BlocProvider(
          create: (context) => getIt<FavArticleActorCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ArticleSearcherCubit>(),
        ),
        BlocProvider(
          create: (context) =>
              getIt<UnitPreferenceWatcherCubit>()..getUnitPreference(),
        ),
        BlocProvider(
          create: (context) => getIt<TrackerWatcherCubit>()
            ..init()
            ..getTrackers(),
        ),
        BlocProvider(
          create: (context) => getIt<UnitPreferenceActorCubit>(),
        ),
        BlocProvider(create: (context) => getIt<IntroCubit>()..checkFirstTime())
      ],
      child: Builder(builder: (context) {
        return MultiBlocListener(
          listeners: [
            BlocListener<FavArticleActorCubit, FavArticleActorState>(
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
                    loadInProgress: (_) {});
              },
            ),
            BlocListener<MilestoneActorCubit, MilestoneActorState>(
              listener: (context, state) {
                state.map(
                    initial: (_) {},
                    loadInProgress: (_) {},
                    changeMilestoneCompletionPhaseSuccess: (state) {
                      context.read<MilestoneWatcherCubit>().getMilestones();
                    },
                    changeMilestoneCompletionPhaseFailure: (state) {
                      //TODO notify user about changeMilestoneCompletionPhaseFailure
                    });
              },
            ),
            BlocListener<UnitPreferenceActorCubit, UnitPreferenceActorState>(
              listener: (context, state) {
                state.map(
                    initial: (_) {},
                    loadInProgress: (_) {},
                    saveUnitPreferenceSuccess: (state) {
                      context
                          .read<UnitPreferenceWatcherCubit>()
                          .getUnitPreference();
                    },
                    saveUnitPreferenceFail: (state) {
                      //TODO notify user about saveUnitPreferenceFail
                    });
              },
            ),
          ],
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor:
                  Colors.grey[50]!, // set your desired status bar color here
            ),
            child: MaterialApp.router(
              routerConfig: goRouter,
              title: "Care Companion",
              debugShowCheckedModeBanner: false,
            ),
          ),
        );
      }),
    );
  }
}

import 'package:cash_manager/domain/article/article.dart';
import 'package:cash_manager/presentation/article/article_overview_page.dart';
import 'package:cash_manager/presentation/article/article_page.dart';
import 'package:cash_manager/presentation/article/article_saved/article_saved_page.dart';
import 'package:cash_manager/presentation/article/article_search/article_search_page.dart';
import 'package:cash_manager/presentation/core/constants.dart';
import 'package:cash_manager/presentation/core/widgets/scaffold_with_bottom.dart';
import 'package:cash_manager/presentation/intro/intro_page.dart';
import 'package:cash_manager/presentation/milestone/milestone_overview_page.dart';
import 'package:cash_manager/presentation/splash/splash_page.dart';
import 'package:cash_manager/presentation/tracker/tracker_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final goRouter = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: "/",
    routes: [
      ShellRoute(

          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return ScaffoldWithBottomNavBar(child: child);
          },
          routes: [
            GoRoute(
              path: PageRoutes.trackerPage,
              pageBuilder: (context, state) => NoTransitionPage(
                child: TrackerPage(),
              ),
            ),
            GoRoute(
              path: PageRoutes.milestoneOverviewPage,
              pageBuilder: (context, state) => NoTransitionPage(
                child: MilestoneOverviewPage(),
              ),
            ),
            GoRoute(
                path: PageRoutes.articleOverviewPage,
                pageBuilder: (context, state) => NoTransitionPage(
                      child: ArticleOverviewPage(),
                    ),
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: PageRoutes.searchPage,
                    pageBuilder: (context, state) => NoTransitionPage(
                      child: ArticleSearchPage(),
                    ),
                  ),
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: PageRoutes.savedPage,
                    pageBuilder: (context, state) => NoTransitionPage(
                      child: ArticleSavedPage(),
                    ),
                  ),
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    redirect: (context, state) {
                      if (state.extra == null) {
                        return PageRoutes.articleOverviewPage;
                      }
                      return null;
                    },
                    path: PageRoutes.articlePage,
                    pageBuilder: (context, state) => NoTransitionPage(
                      child: ArticlePage(
                        initialArticle: state.extra as Article,
                      ),
                    ),
                  ),
                ]),
          ]),
      GoRoute(
        path: '/',
        pageBuilder: (context, state) =>  NoTransitionPage(
          child: SplashPage(),
        ),
      ),
      GoRoute(
        path: PageRoutes.introPage,
        pageBuilder: (context, state) => NoTransitionPage(
          child: IntroPage(),
        ),
      ),
    ]);
void goToIntroPage(BuildContext context) => context.pushReplacement(
  PageRoutes.introPage,
);

void goToArticleOverviewPage(BuildContext context) => context.go(
      PageRoutes.articleOverviewPage,
    );

void goToArticlePage(BuildContext context, Article article) =>
    context.push("${PageRoutes.articleOverviewPage}/${PageRoutes.articlePage}",
        extra: article);

void goToSearchPage(BuildContext context) => context.push(
      "${PageRoutes.articleOverviewPage}/${PageRoutes.searchPage}",
    );

void goToSavedPage(BuildContext context) => context.push(
      "${PageRoutes.articleOverviewPage}/${PageRoutes.savedPage}",
    );

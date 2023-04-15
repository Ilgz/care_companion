import 'package:cash_manager/domain/article/article.dart';
import 'package:cash_manager/presentation/article/article_overview_page.dart';
import 'package:cash_manager/presentation/article/article_page.dart';
import 'package:cash_manager/presentation/core/constants.dart';
import 'package:cash_manager/presentation/intro/intro_page.dart';
import 'package:cash_manager/presentation/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final goRouter = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: PageRoutes.articleOverviewPage,
    routes: [
      GoRoute(

        path: PageRoutes.articleOverviewPage,
        pageBuilder: (context, state) => NoTransitionPage(
          child: ArticleOverviewPage(),
        ),
          routes: [
            GoRoute(
              path: PageRoutes.searchPage,
              pageBuilder: (context, state) => NoTransitionPage(
                child: SearchPage(),
              ),
            ),
            GoRoute(
              redirect: (context, state) {
                if (state.extra == null) {
                  return PageRoutes.articleOverviewPage;
                }
                return null;
              },
              path: PageRoutes.articlePage,
              pageBuilder: (context, state) => NoTransitionPage(
                child: ArticlePage( initialArticle: state.extra as Article,),
              ),
            ),
          ]
      ),
      GoRoute(
          path: PageRoutes.introPage,
          pageBuilder: (context, state) => NoTransitionPage(
                child: IntroPage(),
              ),
          ),
    ]);

void goToSignInPage(BuildContext context) => context.pushReplacement(
      PageRoutes.articleOverviewPage,
    );
void goToArticlePage(BuildContext context,Article article) => context.push(
  "${PageRoutes.articleOverviewPage}/${PageRoutes.articlePage}",extra: article
);
void goToSearchPage(BuildContext context) => context.push(
      "${PageRoutes.articleOverviewPage}/${PageRoutes.searchPage}",
    );

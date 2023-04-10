import 'package:cash_manager/presentation/article/article_overview.dart';
import 'package:cash_manager/presentation/core/constants.dart';
import 'package:cash_manager/presentation/intro/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final goRouter =
GoRouter(navigatorKey: _rootNavigatorKey, initialLocation: PageRoutes.articlePage, routes: [
  GoRoute(
      path: PageRoutes.articlePage,
      pageBuilder: (context, state) =>   NoTransitionPage(
        child: ArticleOverview(),
      ),
  ),
  GoRoute(
    path: PageRoutes.introPage,
    pageBuilder: (context, state) =>   NoTransitionPage(
      child: IntroPage(),
    ),
  ),
]);

void goToSignInPage(BuildContext context) => context.pushReplacement(
  PageRoutes.articlePage,
);




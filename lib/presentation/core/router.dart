import 'package:cash_manager/presentation/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final goRouter =
GoRouter(navigatorKey: _rootNavigatorKey, initialLocation: PageRoutes.articlePage, routes: [
  GoRoute(
      path: PageRoutes.articlePage,
      pageBuilder: (context, state) =>  const NoTransitionPage(
        child: SizedBox(),
      ),

  ),


]);

void goToSignInPage(BuildContext context) => context.pushReplacement(
  PageRoutes.articlePage,
);




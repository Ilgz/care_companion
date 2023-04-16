import 'package:cash_manager/application/article/article_watcher/article_watcher_cubit.dart';
import 'package:cash_manager/domain/article/article.dart';
import 'package:cash_manager/presentation/article/widgets/article_card.dart';
import 'package:cash_manager/presentation/article/widgets/custom_scaffold.dart';
import 'package:cash_manager/presentation/core/widgets/critical_failure_card.dart';
import 'package:cash_manager/presentation/core/widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ArticleSavedPage extends StatelessWidget {
  const ArticleSavedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Bookmarked",
      showBackButton:true,
      body: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          BlocBuilder<ArticleWatcherCubit, ArticleWatcherState>(
            builder: (context, state) {
              return state.map(
                  initial: (_) => const SizedBox(),
                  loadInProgress: (_) => const CustomProgressIndicator(),
                  loadSuccess: (state) {
                    final List<Article> articles = state.articles
                        .where((article) => article.isFav)
                        .toList();
                    if (articles.isEmpty) {
                      return Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Add Bookmarks",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Text(
                                "Don't forget to bookmark the articles",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            final article = articles[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: ArticleCard(
                                article: article,
                              ),
                            );
                          });
                    }
                  },
                  loadFailure: (_) => const CriticalFailureCard());
            },
          )
        ],
      ),
    );
  }
}

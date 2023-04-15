import 'package:cash_manager/application/article/article_fav_status_updater/article_fav_status_updater_cubit.dart';
import 'package:cash_manager/application/article/article_watcher/article_watcher_cubit.dart';
import 'package:cash_manager/presentation/article/widgets/article_card.dart';
import 'package:cash_manager/presentation/core/router.dart';
import 'package:cash_manager/presentation/core/widgets/critical_failure_card.dart';
import 'package:cash_manager/presentation/core/widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ArticleOverviewPage extends StatelessWidget {
  const ArticleOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Articles",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                IconButton(onPressed: () {
                  goToSearchPage(context);
                }, icon: Icon(Icons.search)),
                SizedBox(
                  width: 4,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bookmark_border_outlined)),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            BlocBuilder<ArticleWatcherCubit, ArticleWatcherState>(
              builder: (context, state) {
                return state.map(
                    initial: (_) => const SizedBox(),
                    loadInProgress: (_) => CustomProgressIndicator(),
                    loadSuccess: (state) {
                      context
                          .read<ArticleFavoriteStatusUpdaterCubit>()
                          .updateArticleList(state.articles);
                      return BlocBuilder<ArticleFavoriteStatusUpdaterCubit,
                          ArticleFavoriteStatusUpdaterState>(
                        builder: (context, state) {
                          return Expanded(
                            child: ScrollConfiguration(
                              behavior: ScrollConfiguration.of(context)
                                  .copyWith(scrollbars: false),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.articles.length,
                                  itemBuilder: (context, index) {
                                    final article = state.articles[index];
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16.0),
                                      child: ArticleCard(
                                        article: article,
                                      ),
                                    );
                                  }),
                            ),
                          );
                        },
                      );
                    },
                    loadFailure: (_) => CriticalFailureCard());
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:cash_manager/application/article/article_searcher/article_searcher_cubit.dart';
import 'package:cash_manager/application/article/article_watcher/article_watcher_cubit.dart';
import 'package:cash_manager/application/article/fav_article_watcher/fav_article_cubit.dart';
import 'package:cash_manager/presentation/article/widgets/article_card.dart';
import 'package:cash_manager/presentation/article/widgets/custom_scaffold.dart';
import 'package:cash_manager/presentation/core/router.dart';
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
      body: Column(
        children: [
          Row(
            children: [
              Expanded(child: Align(alignment:Alignment.centerLeft,child: IconButton(onPressed: (){
                context.pop();
              } , icon: Icon(Icons.keyboard_backspace_outlined),color: Colors.black,))),
              Expanded(
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "Bookmarked",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              Expanded(child: SizedBox())
            ],
          ),
          SizedBox(
            height: 8,
          ),
          // BlocBuilder<FavArticleCubit, FavArticleState>(
          //   builder: (context, state) {
          //     return state.map(
          //         initial: (_) => const SizedBox(),
          //         loadInProgress: (_) => CustomProgressIndicator(),
          //         loadSuccess: (state) {
          //           return Expanded(
          //             child: ListView.builder(
          //                 shrinkWrap: true,
          //                 itemCount: state.articles.length,
          //                 itemBuilder: (context, index) {
          //                   final article = state.articles[index];
          //                   return Padding(
          //                     padding:
          //                     const EdgeInsets.only(bottom: 16.0),
          //                     child: ArticleCard(
          //                       article: article,
          //                     ),
          //                   );
          //                 }),
          //           );
          //         },
          //         loadFailure: (_) => CriticalFailureCard());
          //   },
          // )
        ],
      ),
    );
  }
}

import 'package:cash_manager/application/article/article_watcher/article_watcher_cubit.dart';
import 'package:cash_manager/application/article/fav_article_actor/fav_article_actor_cubit.dart';
import 'package:cash_manager/domain/article/article.dart';
import 'package:cash_manager/presentation/core/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({Key? key, required this.initialArticle}) : super(key: key);
  final Article initialArticle;

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ArticleWatcherCubit,
          ArticleWatcherState>(
        builder: (context, state) {
          final article = (state.maybeMap(loadSuccess: (state)=>state.articles,orElse: ()=>[])).firstWhere(
              (article) => article.uid == initialArticle.uid,
              orElse: () => Article.empty());
          return CustomScaffold(
            isScrolling: true,
            showBackButton: true,
            title: "",
            actions: [
              IconButton(
                onPressed: () {
                  if (article.isFav) {
                    context
                        .read<FavArticleActorCubit>()
                        .deleteFavArticle(article);
                  } else {
                    context
                        .read<FavArticleActorCubit>()
                        .createFavArticle(article);
                  }
                },
                icon: Icon(
                  article.isFav
                      ? Icons.bookmark
                      : Icons.bookmark_border_outlined,
                  color: article.isFav ? Color(0xfffd894f) : Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert_outlined),
                color: Colors.black,
              ),
            ],
            body : Column(
              children: [
                Text(
                  article.name.getOrCrash(),
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[900],
                    letterSpacing: 1.2,
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 32,
                      height: 32,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 18,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Padding(
                            padding: EdgeInsets.all(100.0),
                            child: Text(
                              "A",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 400),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Admin",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        Text(
                            "1 min read | ${DateFormat('d MMMM yyyy').format(article.date)}",
                            style: TextStyle(fontSize: 12, color: Colors.grey))
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  article.body.getOrCrash(),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.blueGrey[700],
                    letterSpacing: 0.3,
                    height: 1.6,
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(
                  height: 32,
                )
              ],
            ),
          );
        },

    );
  }
}

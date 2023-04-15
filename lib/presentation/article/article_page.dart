import 'package:cash_manager/application/article/article_fav_status_updater/article_fav_status_updater_cubit.dart';
import 'package:cash_manager/application/article/fav_article_actor/fav_article_actor_cubit.dart';
import 'package:cash_manager/domain/article/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({Key? key, required this.initialArticle}) : super(key: key);
  final Article initialArticle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            child: BlocBuilder<ArticleFavoriteStatusUpdaterCubit,
                ArticleFavoriteStatusUpdaterState>(
              builder: (context, state) {
                final article = state.articles.firstWhere(
                    (article) => article.uid == initialArticle.uid,
                    orElse: () => Article.empty());
                return Column(
                  children: [
                    Row(children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_outlined),
                        color: Colors.black,
                      ),
                      Spacer(),
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
                          color:
                              article.isFav ? Color(0xfffd894f) : Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_vert_outlined),
                        color: Colors.black,
                      ),
                    ]),
                    SizedBox(
                      height: 8,
                    ),
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
                      children:  [
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 400),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Admin",style: TextStyle(fontSize: 16,color: Colors.black),),
                            Text("1 min read | ${DateFormat('d MMMM yyyy').format(article.date)}",style: TextStyle(fontSize:12,color: Colors.grey))
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

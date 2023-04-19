import 'package:cash_manager/application/article/fav_article_actor/fav_article_actor_cubit.dart';
import 'package:cash_manager/domain/article/article.dart';
import 'package:cash_manager/presentation/core/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({Key? key, required this.article}) : super(key: key);
  final Article article;
  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat('d MMMM yyyy').format(article.date);
    return  InkWell(
      onTap: (){
        print("goTo");
        goToArticlePage(context,article);
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 60,
              width: 60,
                       child: ClipRRect(borderRadius:BorderRadius.circular(8),child: Image.asset("assets/images/${article.image}.png",width: double.infinity,height: double.infinity,fit: BoxFit.cover,)),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          formattedDate,
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey[600]),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: (){
                            if(article.isFav){
                              context.read<FavArticleActorCubit>().deleteFavArticle(article);
                            }else{
                              context.read<FavArticleActorCubit>().createFavArticle(article);
                            }
                          },
                          child: Icon(article.isFav?Icons.bookmark:Icons.bookmark_border_outlined,
                            size: 18,
                            color:article.isFav?Color(0xfffd894f):Colors.grey,
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          article.name.getOrCrash(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.blueGrey[900],
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

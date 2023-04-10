import 'package:cash_manager/presentation/article/widgets/article_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArticleOverview extends StatelessWidget {
  const ArticleOverview({Key? key}) : super(key: key);

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
                IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                SizedBox(
                  width: 4,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bookmark_border_outlined)),
              ],
            ),
            ArticleCard()
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final String formattedDate = DateFormat('d MMMM yyyy').format(now);
    return  GestureDetector(
      onTap: (){
        //TODO implement articled tapping functionality
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.green),
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
                        Icon(Icons.bookmark,
                          size: 18,
                          color: Color(0xfffd894f),
                        )
                      ],
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Use of topical fluorides for caries prevention in primary teeth.",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
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

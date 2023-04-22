import 'package:flutter/material.dart';

class IndicatorText extends StatelessWidget {
  const IndicatorText({Key? key, required this.indicatorName, required this.indicatorValue}) : super(key: key);
  final String indicatorName;
  final String indicatorValue;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(children: [
          Text(indicatorName,style: TextStyle(fontSize: 12,color: Colors.grey[600]),),
          SizedBox(height: 4,),
          Text(indicatorValue,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
        ],),
      ),
    );
  }
}

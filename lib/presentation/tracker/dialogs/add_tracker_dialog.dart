import 'package:flutter/material.dart';

class AddTrackerDialog extends StatelessWidget {
  const AddTrackerDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(mainAxisSize: MainAxisSize.min,children: [
        SizedBox(height: 16,),
        Row(children: [
          Expanded(child: TextField()),

        ],)
      ],),
    ),);
  }

}

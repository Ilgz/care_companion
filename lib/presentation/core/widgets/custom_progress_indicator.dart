import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({Key? key,this.color}) : super(key: key);
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Color(0xfffd894f)),
      ),
    );
  }
}

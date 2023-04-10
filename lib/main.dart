import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'presentation/core/widgets/app_widget.dart';
void main() async{
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const AppWidget());
}



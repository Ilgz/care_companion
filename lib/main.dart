import 'package:cash_manager/domain/milestone/milestone.dart';
import 'package:cash_manager/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'presentation/core/widgets/app_widget.dart';
void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(MilestoneAdapter());
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.prod);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const AppWidget());
}



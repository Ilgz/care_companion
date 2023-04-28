import 'package:cash_manager/domain/milestone/milestone.dart';
import 'package:cash_manager/domain/tracker/unit_preference.dart';
import 'package:cash_manager/infrastructure/tracker/tracker_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@Scope(Environment.prod)
@module
abstract class AppInjectableProdModule {
  @lazySingleton
  http.Client get httpClient => http.Client();
  @preResolve
  @Named("favArticleUidBox")
  Future<Box<String>> get favArticleBox =>
      Hive.openBox("favArticleUid");
  @preResolve
  @Named("searchHistoryBox")
  Future<Box<String>> get searchHistoryBox =>
      Hive.openBox("searchHistory");
  @preResolve
  @Named("milestoneBox")
  Future<Box<Milestone>> get milestoneBox =>
      Hive.openBox("milestone");

  @preResolve
  @Named("trackerBox")
  Future<Box<TrackerDto>> get trackerBox =>
      Hive.openBox("tracker");
  @preResolve
  @Named("unitPreferenceBox")
  Future<Box<UnitPreference>> get unitPreferenceBox =>
      Hive.openBox("unitPreference");
  @preResolve
  @Named("settingBox")
  Future<Box<bool>> get settingBox =>
      Hive.openBox("setting");
}

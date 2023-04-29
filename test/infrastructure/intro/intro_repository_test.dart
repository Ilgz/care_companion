import 'dart:math';

import 'package:cash_manager/domain/intro/i_intro_facade.dart';
import 'package:cash_manager/infrastructure/intro/intro_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';

void main() {
  late Box<bool> settingBox;
  late IntroFacade introFacade;

  setUp(() async{
    await setUpTestHive();
    settingBox = await Hive.openBox("setting");
    introFacade = IntroFacade(settingBox);
  });
  tearDown(() async {
    await settingBox.clear();
  });
  group('isFirstTime', () {
    test('should return true when isFirstTime is not set', () async {
      // act
      final result = await introFacade.isFirstTime();

      // assert
      expect(result, true);
    });

    test('should return stored value when isFirstTime is set', () async {
      // arrange
      await settingBox.put('is_first_time', false);

      // act
      final result = await introFacade.isFirstTime();

      // assert
      expect(result, false);
    });
  });

  group('setFirstTime', () {
    test('should store the provided value', () async {
      // arrange
      final value = Random().nextBool();

      // act
      await introFacade.setFirstTime(value);

      // assert
      expect((await introFacade.isFirstTime()), value);
    });
  });
}

import 'package:cash_manager/domain/milestone/value_objects.dart';
import 'package:cash_manager/domain/tracker/tracker.dart';
import 'package:cash_manager/domain/tracker/tracker_failure.dart';
import 'package:cash_manager/domain/tracker/unit_preference.dart';
import 'package:cash_manager/infrastructure/tracker/tracker_dto.dart';
import 'package:cash_manager/infrastructure/tracker/tracker_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';

import '../../fixtures/faker.dart';

void main() {
  late Box<TrackerDto> trackerBox;
  late Box<UnitPreference> unitPreferenceBox;
  late TrackerRepository trackerRepository;
  setUpAll(() async {
    Hive.registerAdapter(TrackerDtoAdapter());
    Hive.registerAdapter(HeightUnitAdapter());
    Hive.registerAdapter(WeightUnitAdapter());
    Hive.registerAdapter(UnitPreferenceAdapter());    await setUpTestHive();
    await setUpTestHive();
  });
  setUp(() async {
    trackerBox = await Hive.openBox("tracker");
    unitPreferenceBox = await Hive.openBox("unitPreference");
    trackerRepository =
        TrackerRepository( trackerBox,  unitPreferenceBox);
  });

  tearDown(() async {
    await trackerBox.clear();
    await unitPreferenceBox.clear();
  });

  group('getTrackers', () {
    test('should return trackers when the box is not empty', () async {
      // arrange
      final tracker = Tracker.empty().copyWith(weight: Measurement(getRandomDouble()),height: Measurement(getRandomDouble()));
      await trackerBox.put("test_tracker", TrackerDto.fromDomain(tracker));

      // act
      final result = await trackerRepository.getTrackers();

      // assert
      expect(result, isA<Right<TrackerFailure, List<Tracker>>>());
      expect(result.getOrElse(() => []), [tracker]);
    });
  });

  group('createTracker', () {
    test('should add a tracker when it does not already exist', () async {
      // arrange
      final tracker = Tracker.empty().copyWith(weight: Measurement(getRandomDouble()),height: Measurement(getRandomDouble()));

      // act
      final result = await trackerRepository.createTracker(tracker);

      // assert
      expect(result, isA<Right<TrackerFailure, Unit>>());
      expect(trackerBox.values.toList(), [TrackerDto.fromDomain(tracker)]);
    });
  });

  group('getUnitPreference', () {
    test('should return the saved unit preference', () async {
      // arrange
      final unitPreference = UnitPreference(
          heightUnit: HeightUnit.centimeter, weightUnit: WeightUnit.kilogram);
      await unitPreferenceBox.put("preference", unitPreference);

      // act
      final result = await trackerRepository.getUnitPreference();

      // assert
      expect(result, isA<Right<TrackerFailure, UnitPreference>>());
      expect(result.getOrElse(() => UnitPreference(
          heightUnit: HeightUnit.inch, weightUnit: WeightUnit.pound)), unitPreference);
    });
  });

  group('saveUnitPreference', () {
    test('should save the unit preference', () async {
      // arrange
      final unitPreference = UnitPreference(
          heightUnit: HeightUnit.centimeter, weightUnit: WeightUnit.kilogram);

      // act
      final result = await trackerRepository.saveUnitPreference(unitPreference);

      // assert
      expect(result, isA<Right<TrackerFailure, Unit>>());
      expect(unitPreferenceBox.get("preference"), unitPreference);
    });
  });
}

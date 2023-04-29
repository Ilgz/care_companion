import 'dart:math';

import 'package:cash_manager/domain/milestone/milestone.dart';
import 'package:cash_manager/domain/milestone/milestone_failure.dart';
import 'package:cash_manager/infrastructure/milestone/milestone_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';

void main() {
  late Box<Milestone> milestoneBox;
  late MilestoneRepository milestoneRepository;
  setUpAll(() async {
    Hive.registerAdapter(MilestoneAdapter());
    await setUpTestHive();
  });
  setUp(() async {
    milestoneBox = await Hive.openBox("milestone");
    milestoneRepository = MilestoneRepository(milestoneBox);
  });

  tearDown(() async {
    await milestoneBox.clear();
  });

  group('getMilestones', () {
    test('should return milestones when the box is not empty', () async {
      // arrange
      final milestone = Milestone("Test Milestone", 0, 0);
      await milestoneBox.put("test_milestone", milestone);

      // act
      final result = await milestoneRepository.getMilestones();

      // assert
      expect(result, isA<Right<MilestoneFailure, List<Milestone>>>());
      expect(result.getOrElse(() => []), [milestone]);
    });

    test('should return the default milestones when the box is empty',
        () async {
      // act
      final result = await milestoneRepository.getMilestones();

      // assert
      expect(result, isA<Right<MilestoneFailure, List<Milestone>>>());
      expect(result.getOrElse(() => []).length, greaterThan(0));
    });
  });

  group('changeMilestoneCompletionPhase', () {
    test('should update the milestone completion phase', () async {
      // arrange
      final completionPhaseIndex = Random().nextInt(3);
      final milestone = Milestone("Test Milestone", 0, 0);
      await milestoneBox.put("test_milestone", milestone);
      final updatedMilestone = Milestone(
          milestone.name, milestone.category, milestone.ageRangeIndex,
          completionPhaseIndex: completionPhaseIndex);
      // act
      final result = await milestoneRepository
          .changeMilestoneCompletionPhase(updatedMilestone);

      // assert
      expect(result, isA<Right<MilestoneFailure, Unit>>());
      expect(milestoneBox.get("test_milestone"), updatedMilestone);
    });

    test('should return MilestoneFailure when the milestone is not found',
        () async {
      // arrange
      final milestone = Milestone("Nonexistent Milestone", 0, 0);

      // act
      final result =
          await milestoneRepository.changeMilestoneCompletionPhase(milestone);

      // assert
      expect(result, isA<Left<MilestoneFailure, Unit>>());
    });
  });
}

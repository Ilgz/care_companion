import 'package:cash_manager/domain/milestone/i_milestone_repository.dart';
import 'package:cash_manager/domain/milestone/milestone.dart';
import 'package:cash_manager/domain/milestone/milestone_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IMilestoneRepository)
class MilestoneRepository implements IMilestoneRepository {
  final Box<Milestone> _milestoneBox;

  MilestoneRepository(@Named("milestoneBox") this._milestoneBox);

  @override
  Future<Either<MilestoneFailure, Unit>> changeMilestoneCompletionPhase(
      Milestone updateMilestone) async {
    try {
      final milestones = await getMilestones();
      return milestones.fold((failure) {
        return left(failure);
      }, (milestones) async {
        final index=milestones.indexWhere((milestone) => milestone.name==updateMilestone.name);
        if (index != -1) {
          if(_milestoneBox.isEmpty){
          await  _milestoneBox.addAll(milestones);
          }
          _milestoneBox.putAt(index, updateMilestone);
          return right(unit);
        } else {
          // Milestone not found
          throw HiveError("Milestone not found");
        }
      });
    } on HiveError catch (e) {
      return left(const MilestoneFailure.unexpected());
    }

  }

  @override
  Future<Either<MilestoneFailure, List<Milestone>>> getMilestones() async {
    late final List<Milestone> milestones;
    if (_milestoneBox.values.isNotEmpty) {
      milestones = _milestoneBox.values.toList();
    } else {
      milestones = [
        //0-3 Months
        Milestone(
          "Able to bring hands to mouth",
          0,
          0,
        ),
        Milestone(
          "Able to move fists from closed to open",
          0,
          0,
        ),
        Milestone(
          "Able to calm with rocking, touching, and gentle sounds",
          1,
          0,
        ),
        Milestone(
          "While lying on back, attempts to reach for a toy held above their chest",
          1,
          0,
        ),
        Milestone(
          "Coos and smiles",
          2,
          0,
        ),
        Milestone(
          "Makes eye contact",
          2,
          0,
        ),
        Milestone(
          "Drinks 2 oz. to 6 oz. of liquid per feeding , 6 times per day",
          3,
          0,
        ),
        Milestone(
          "Latches onto bottle",
          3,
          0,
        ),
        //4-6 Months
        Milestone("Reaches for toys while on tummy", 0, 1),
        Milestone("Rolls from back to tummy and tummy to back", 0, 1),
        Milestone("Generally happy when not hungry or tired", 1, 1),
        Milestone("Is not upset by everyday sounds", 1, 1),
        Milestone("Listens and responds when spoken to", 2, 1),
        Milestone("Notices toys that make sounds", 2, 1),
        Milestone("Begins to eat cereals and pureed foods", 3, 1),
        Milestone("Opens mouths as spoon approaches", 3, 1),
        //7-9 Months
        Milestone("In simple play imitates others", 0, 2),
        Milestone("Moves from tummy or back into sitting", 0, 2),
        Milestone("Focuses on objects near and far", 1, 2),
        Milestone(
            "Investigates shapes, sizes, and textures of toys and surroundings",
            1,
            2),
        Milestone("Imitates sounds", 2, 2),
        Milestone("Recognizes sound of their name", 2, 2),
        Milestone("Begins to eat thicker pureed and mashed table foods", 3, 2),
        Milestone("Shows strong reaction to new smells and tastes", 3, 2),
        //10-12 Months
        Milestone("Claps hands", 0, 3),
        Milestone("Maintains balance in sitting when throwing objects", 0, 3),
        Milestone("Enjoys listening to songs", 1, 3),
        Milestone(
            "Crawls to or away from objects baby sees in the distance", 1, 3),
        Milestone("Pays attention to where you are looking and pointing", 2, 3),
        Milestone("Says one or two words", 2, 3),
        Milestone("Begins to use an open cup", 3, 3),
        Milestone("Eating an increasing variety of food", 3, 3),
        //13-18 Months
        Milestone("Claps hands", 0, 4),
        Milestone("Maintains balance in sitting when throwing objects", 0, 4),
        Milestone("Enjoys listening to songs", 1, 4),
        Milestone(
            "Crawls to or away from objects baby sees in the distance", 1, 4),
        Milestone("Pays attention to where you are looking and pointing", 2, 4),
        Milestone("Says one or two words", 2, 4),
        Milestone("Begins to use an open cup", 3, 4),
        Milestone("Eating an increasing variety of food", 3, 4),
        //19-24 Months
        Milestone("Begins to jump with both feet leaving the ground", 0, 5),
        Milestone("Climbs on low furniture", 0, 5),
        Milestone("Flips switches on and off", 1, 5),
        Milestone("Sorts shapes and colors", 1, 5),
        Milestone("Consistently imitates new words", 2, 5),
        Milestone("Enjoys listening to stories", 2, 5),
        //2-3 Years
        Milestone("Most speech is understood by caregiver", 2, 6),
        Milestone(
            "Simple understanding of concepts including color, space, time",
            2,
            6),
        Milestone("Understands most simple sentences", 2, 6),
        Milestone("Understands basic nouns and pronouns", 2, 6),
      ];
    }
    ;
    return right(milestones);
  }
}

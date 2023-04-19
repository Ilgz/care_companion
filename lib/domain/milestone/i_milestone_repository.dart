import 'package:cash_manager/domain/article/article.dart';
import 'package:cash_manager/domain/article/article_failure.dart';
import 'package:cash_manager/domain/milestone/milestone.dart';
import 'package:cash_manager/domain/milestone/milestone_failure.dart';
import 'package:dartz/dartz.dart';
abstract class IMilestoneRepository{
  Future<Either<MilestoneFailure,List<Milestone>>> getMilestones();
  Future<Either<MilestoneFailure, Unit>>changeMilestoneCompletionPhase(Milestone milestone);
}
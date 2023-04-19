import 'package:cash_manager/domain/milestone/milestone_category.dart';
import 'package:flutter/material.dart';

class Milestone {
  static final List<String> ageRangeDivisions = [
    "0-3 Months",
    "4-6 Months",
    "7-9 Months",
    "10-12 Months",
    "13-18 Months",
    "19-24 Months",
    "2-3 Years",
    "4-6 Years"
  ];
  static final List<MilestoneCategory> milestoneCategories = [
    const MilestoneCategory(
      "Motor",
      Icons.directions_walk_rounded,
      Color(0xffCE6C9F),
      Color(0xffF2E1E7),
    ),
    const MilestoneCategory("Sensory", Icons.remove_red_eye_rounded,
        Color(0xff76A322), Color(0xffE6EFD2)),
    const MilestoneCategory("Communication", Icons.insert_comment_outlined,
        Color(0xffA46BB8), Color(0xffEDE0F2)),
    const MilestoneCategory("Feeding", Icons.food_bank_outlined, Color(0xffD6BC41),
        Color(0xffF9F2D8)),
  ];
   String name;
   int category;
   int ageRangeIndex;
   int completionPhaseIndex;
  Milestone(this.name, this.category, this.ageRangeIndex, {this.completionPhaseIndex=0});
}

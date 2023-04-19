import 'package:cash_manager/application/milestone/milestone_filter/milestone_filter_cubit.dart';
import 'package:cash_manager/application/milestone/milestone_watcher/milestone_watcher_cubit.dart';
import 'package:cash_manager/domain/milestone/milestone.dart';
import 'package:cash_manager/presentation/core/widgets/critical_failure_card.dart';
import 'package:cash_manager/presentation/core/widgets/custom_progress_indicator.dart';
import 'package:cash_manager/presentation/core/widgets/custom_scaffold.dart';
import 'package:cash_manager/presentation/milestone/widgets/age_range_dropdown.dart';
import 'package:cash_manager/presentation/milestone/widgets/category_dropdown.dart';
import 'package:cash_manager/presentation/milestone/widgets/milestone_card.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MilestoneOverviewPage extends StatelessWidget {
  const MilestoneOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Milestones",
      body: BlocBuilder<MilestoneWatcherCubit, MilestoneWatcherState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => const SizedBox(),
            loadInProgress: (_) => const CustomProgressIndicator(),
            loadSuccess: (watcherSuccessState) {
              context
                  .read<MilestoneFilterCubit>()
                  .updateMilestones(watcherSuccessState.milestones);
              return BlocBuilder<MilestoneFilterCubit, MilestoneFilterState>(
                builder: (context, state) {
                  return ListView(
                    children: [
                      AgeRangeDropdown(
                        ageRange: state.ageRange,
                        isDropdownActive: state.isAgeRangeDropdownActive,
                        onChanged: (value) {
                          if (value != null) {
                            context.read<MilestoneFilterCubit>().changeAgeRange(
                                value, watcherSuccessState.milestones);
                          }
                        },
                        onMenuStateChange: (isOpened) {
                          context
                              .read<MilestoneFilterCubit>()
                              .changeAgeRangeDropdownStatus(isOpened);
                        },
                      ),
                      const SizedBox(height: 16),
                      CategoryDropdown(
                        category: state.category,
                        isDropdownActive: state.isCategoryDropdownActive,
                        onChanged: (value) {
                          if (value != null) {
                            context.read<MilestoneFilterCubit>().changeCategory(
                                value, watcherSuccessState.milestones);
                          }
                        },
                        onMenuStateChange: (isOpened) {
                          context
                              .read<MilestoneFilterCubit>()
                              .changeCategoryDropdownStatus(isOpened);
                        },
                      ),
                      const SizedBox(height: 16),

                      state.milestones.isEmpty
                          ? Container(padding:EdgeInsets.all(16),decoration: BoxDecoration(borderRadius:BorderRadius.circular(16),color:Color(0xfffd894f).withOpacity(0.2)),
                          child: Text(
                            "There are no milestones related to this age range or topic. Try changing the age range filter.",
                            style: TextStyle(
                                color: Colors.black, fontSize: 16),))
                          : MilestoneList(milestones: state.milestones),
                    ],
                  );
                },
              );
            },
            loadFailure: (_) => const CriticalFailureCard(),
          );
        },
      ),
    );
  }
}


class MilestoneList extends StatelessWidget {
  final List<Milestone> milestones;

  const MilestoneList({
    Key? key,
    required this.milestones,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: milestones.length,
        itemBuilder: (context, index) {
          final milestone = milestones[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: MilestoneCard(
              milestone: milestone,
            ),
          );
        },
      ),
    );
  }
}


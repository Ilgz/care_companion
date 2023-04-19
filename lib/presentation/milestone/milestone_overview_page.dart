import 'package:cash_manager/application/milestone/milestone_filter/milestone_filter_cubit.dart';
import 'package:cash_manager/application/milestone/milestone_watcher/milestone_watcher_cubit.dart';
import 'package:cash_manager/domain/milestone/milestone.dart';
import 'package:cash_manager/presentation/core/widgets/critical_failure_card.dart';
import 'package:cash_manager/presentation/core/widgets/custom_progress_indicator.dart';
import 'package:cash_manager/presentation/core/widgets/custom_scaffold.dart';
import 'package:cash_manager/presentation/milestone/widgets/age_range_dropdown.dart';
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
                  .filterMilestonesByAgeRange(watcherSuccessState.milestones);
              return BlocBuilder<MilestoneFilterCubit, MilestoneFilterState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      // AgeRangeDropdown(
                      //   ageRange: state.ageRange,
                      //   isDropdownActive: state.isDropdownActive,
                      //   onChanged: (value) {
                      //     if (value != null) {
                      //       context.read<MilestoneFilterCubit>().changeAgeRange(
                      //           value, watcherSuccessState.milestones);
                      //     }
                      //   },
                      //   onMenuStateChange: (isOpened) {
                      //     context
                      //         .read<MilestoneFilterCubit>()
                      //         .changeDropdownStatus(isOpened);
                      //   },
                      // ),
                      // const SizedBox(height: 16),
                      MilestoneList(milestones: state.milestones),
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


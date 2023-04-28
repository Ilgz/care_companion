import 'package:cash_manager/application/tracker/unit_preference_watcher/unit_preference_watcher_cubit.dart';
import 'package:cash_manager/domain/tracker/tracker.dart';
import 'package:cash_manager/domain/tracker/unit_preference.dart';
import 'package:cash_manager/presentation/tracker/dialogs/add_tracker_dialog.dart';
import 'package:cash_manager/presentation/tracker/widgets/indicator_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TrackerChart extends StatelessWidget {
  const TrackerChart({
    super.key,
    required this.trackers,
    required this.isHeightTrackerChart,
  });

  final bool isHeightTrackerChart;
  final List<Tracker> trackers;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.all(16),
        height: 400,
        child: Column(
          children: [
            Row(
              children: [
                BlocBuilder<UnitPreferenceWatcherCubit,
                    UnitPreferenceWatcherState>(
                  builder: (context, state) {
                    String measurement =
                        isHeightTrackerChart ? "height" : "weight";
                    return state.maybeMap(
                        loadSuccess: (state) {
                          final unitType = isHeightTrackerChart
                              ? state.unitPreference.heightUnit.description
                              : state.unitPreference.weightUnit.description;
                          return Text(
                            "$measurement($unitType)",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          );
                        },
                        orElse: () => const SizedBox());
                  },
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AddTrackerDialog(
                              isHeightTrackerChart: isHeightTrackerChart,
                              lastTracker: trackers.last,
                            ));
                  },
                  child: const Icon(
                    Icons.add,
                    color: Color(0xfffd894f),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IndicatorText(
                      indicatorName: "Current:",
                      indicatorValue: (isHeightTrackerChart
                              ? trackers.last.height
                              : trackers.last.weight)
                          .getOrCrash()
                          .toStringAsFixed(1)),
                  const VerticalDivider(
                    width: 1,
                  ),
                  IndicatorText(
                      indicatorName: "Last thirty days:",
                      indicatorValue: calculateMonthlyTrackerValueDifference()),
                  const VerticalDivider(
                    width: 1,
                  ),
                  IndicatorText(
                      indicatorName: "Annual average:",
                      indicatorValue: calculateAnnualAverage()),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: SfCartesianChart(
                legend: Legend(
                  isVisible: false,
                ),
                plotAreaBorderWidth: 0,
                primaryXAxis: DateTimeAxis(
                  majorGridLines: const MajorGridLines(
                    width: 0,
                  ),
                ),
                primaryYAxis: NumericAxis(
                  axisLine: const AxisLine(width: 0, color: Colors.red),
                  minorGridLines: const MinorGridLines(width: 0),
                  minorTickLines: const MinorTickLines(size: 0),
                ),
                series: <ChartSeries>[
                  LineSeries<Tracker, DateTime>(
                    legendItemText: "Ilgiz",
                    legendIconType: LegendIconType.diamond,
                    color: const Color(0xfffd894f),
                    dataSource: trackers,
                    xValueMapper: (Tracker tracker, _) => tracker.date,
                    yValueMapper: (Tracker tracker, _) => isHeightTrackerChart
                        ? tracker.height.getOrCrash()
                        : tracker.weight.getOrCrash(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String calculateAnnualAverage() {
    final currentYearTrackers =
        trackers.where((tracker) => tracker.date.year == DateTime.now().year);
    Set<double> trackerValues = {};
    for (var tracker in currentYearTrackers) {
      if (isHeightTrackerChart) {
        trackerValues.add(tracker.height.getOrCrash());
      } else {
        trackerValues.add(tracker.weight.getOrCrash());
      }
    }
    double sum = trackerValues.fold(
        0.0, (previousValue, element) => previousValue + element);
    double average = sum / trackerValues.length;
    return average.toStringAsFixed(1);
  }

  String calculateMonthlyTrackerValueDifference() {
    final currentMonthTrackers =
        trackers.where((tracker) => tracker.date.month == DateTime.now().month);
    Set<double> trackerValues = {};
    for (var tracker in currentMonthTrackers) {
      if (isHeightTrackerChart) {
        trackerValues.add(tracker.height.getOrCrash());
      } else {
        trackerValues.add(tracker.weight.getOrCrash());
      }
    }
    if (trackerValues.length >= 2) {
      final result = trackerValues.last - trackerValues.first;
      return (result > 0 ? "+" : "") + result.toStringAsFixed(1);
    } else {
      return 0.toString();
    }
  }

}

import 'package:cash_manager/domain/milestone/value_objects.dart';
import 'package:cash_manager/domain/tracker/tracker.dart';
import 'package:cash_manager/presentation/core/widgets/custom_scaffold.dart';
import 'package:cash_manager/presentation/tracker/widgets/tracker_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TrackerPage extends StatelessWidget {
  TrackerPage({Key? key}) : super(key: key);
  final List<Tracker> trackerDataList = [
    // Tracker(date: DateTime(2023, 1, 1), height: Measurement(50), weight: Measurement(3.5)),
    // Tracker(date: DateTime(2023, 2, 1), height: Measurement(70), weight: Measurement(5.5)),
    // Tracker(date: DateTime(2023, 3, 1), height: Measurement(80), weight: Measurement(5.5)),
    // Tracker(date: DateTime(2023, 4, 1), height: Measurement(60), weight: Measurement(5.9)),
    // Tracker(date: DateTime(2023, 5, 1), height: Measurement(90), weight: Measurement(5.9)),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: "Tracker",
        isScrolling: true,
        body: Column(
          children: [
            TrackerChart(trackerDataList: trackerDataList, isHeightGrowChart: false,),
          ],
        ));
  }
}


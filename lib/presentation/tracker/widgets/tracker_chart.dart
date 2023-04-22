import 'package:cash_manager/domain/tracker/tracker.dart';
import 'package:cash_manager/presentation/tracker/tracker_page.dart';
import 'package:cash_manager/presentation/tracker/widgets/indicator_text.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TrackerChart extends StatelessWidget {
  const TrackerChart({
    super.key,
    required this.trackerDataList, required this.isHeightGrowChart,
  });
  final bool isHeightGrowChart;
  final List<Tracker> trackerDataList;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.all(16),
        height: 400,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "weight(kg)",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(
                  Icons.add,
                  color: Color(0xfffd894f),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IndicatorText(
                      indicatorName: "Current:", indicatorValue: "176.4"),
                  VerticalDivider(
                    width: 1,
                  ),
                  IndicatorText(
                      indicatorName: "Last thirty days:",
                      indicatorValue: "+44.1"),
                  VerticalDivider(
                    width: 1,
                  ),
                  IndicatorText(
                      indicatorName: "Annual average:",
                      indicatorValue: "147.0"),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: SfCartesianChart(
                legend: Legend(
                  isVisible: false,
                ),
                plotAreaBorderWidth: 0,
                primaryXAxis: DateTimeAxis(
                  majorGridLines: MajorGridLines(
                    width: 0,
                  ),
                ),
                primaryYAxis: NumericAxis(
                  axisLine: AxisLine(width: 0, color: Colors.red),
                  minorGridLines: MinorGridLines(width: 0),
                  minorTickLines: MinorTickLines(size: 0),
                ),
                series: <ChartSeries>[
                  LineSeries<Tracker, DateTime>(
                    legendItemText: "Ilgiz",
                    legendIconType: LegendIconType.diamond,
                    color: Color(0xfffd894f),
                    dataSource: trackerDataList,
                    xValueMapper: (Tracker tracker, _) => tracker.date,
                    yValueMapper: (Tracker tracker, _) =>
                        tracker.weight.getOrCrash(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

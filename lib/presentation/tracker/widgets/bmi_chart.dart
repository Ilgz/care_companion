import 'dart:math';

import 'package:cash_manager/application/tracker/unit_preference_watcher/unit_preference_watcher_cubit.dart';
import 'package:cash_manager/domain/milestone/value_objects.dart';
import 'package:cash_manager/domain/tracker/tracker.dart';
import 'package:cash_manager/domain/tracker/unit_preference.dart';
import 'package:cash_manager/presentation/core/utils/unit_converter_util.dart';
import 'package:cash_manager/presentation/core/utils/unit_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class BmiChart extends StatelessWidget {
  const BmiChart({
    super.key,
    required this.trackers,
  });

  final List<Tracker> trackers;

  double currentBmi(BuildContext context) {
    // You can calculate the current BMI based on the latest tracker data
    // This is just an example, replace it with your actual BMI calculation
    return context.read<UnitPreferenceWatcherCubit>().state.maybeMap(loadSuccess: (state){
      Tracker currentTracker = trackers.last;
      if( state.unitPreference.heightUnit==HeightUnit.inch){
        currentTracker=currentTracker.copyWith(height: Measurement(inchesToCentimeters(currentTracker.height.getOrCrash())));
      }
      if ( state.unitPreference.weightUnit==WeightUnit.pound){
        currentTracker=currentTracker.copyWith(weight: Measurement(poundsToKilograms(currentTracker.weight.getOrCrash())));
      }
      return currentTracker.weight.getOrCrash() /
          pow(
            (currentTracker.height.getOrCrash() / 100),
            2,
          );
    },orElse: (){
      return 23;
    });
  }


  @override
  Widget build(BuildContext context) {
    final values = [15, 16, 18, 25, 30, 35, 40];
    final sizes = [3, 4, 9, 7, 7, 7];
    final classifications = [
      "Severe Thinness",
      "Thinness",
      "Normal",
      "Overweight",
      "Obese Class I",
      "Obese Class 2",
    ];
    final gradientColors = [
      [
        Color(0xff94abe2),
        Color(0xff2a34af),
      ],
      [
        Color(0xff6ba3fe),
        Color(0xff0b7efd),
      ],
      [
        Color(0xff38dcd3),
        Color(0xff01cbe2),
      ],
      [
        Color(0xfff6eaa6),
        Color(0xfffdcd09),
      ],
      [
        Color(0xfff2d29b),
        Color(0xfffb930a),
      ],
      [
        Color(0xffe98fa2),
        Color(0xfffd0635),
      ],
    ];
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.all(16),
        height: 200,
        child: BlocBuilder<UnitPreferenceWatcherCubit, UnitPreferenceWatcherState>(
  builder: (context, state) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "BMI(kg/m²)",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            RichText(
              text: TextSpan(children: [
                 TextSpan(text:"Values of BMI and categories are taken from",style: TextStyle(color: Colors.grey[600]!)),
                WidgetSpan(
                    child: InkWell(
                  child: const Text(
                    'wikipedia',
                    style: TextStyle(color: Color(0xfffd894f)),
                  ),
                  onTap: () {
                    launchUrl(Uri.parse(
                        "https://en.wikipedia.org/wiki/Body_mass_index"));
                  },
                ))
              ]),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 56,
              child: LayoutBuilder(builder: (context, constraints) {
                final parentWidth = constraints.maxWidth;
                final totalProportion = sizes.fold(
                    0, (previousValue, element) => previousValue + element);
                // Calculate the position of the arrow based on the current BMI
                double arrowPosition = 0;
                double accumulatedWidth = 0;
                double totalWidth =
                    parentWidth * (totalProportion / totalProportion);

                for (int i = 0; i < values.length - 1; i++) {
                  if (currentBmi(context) >= values[i] && currentBmi(context) < values[i + 1]) {
                    double sectionWidth =
                        parentWidth * (sizes[i] / totalProportion) -
                            (i == sizes.length - 1 ? 0 : 2);
                    double sectionStart = accumulatedWidth;
                    double sectionEnd = sectionStart + sectionWidth;
                    arrowPosition = sectionStart +
                        ((currentBmi(context) - values[i]) /
                                (values[i + 1] - values[i])) *
                            (sectionEnd - sectionStart);
                    break;
                  }
                  accumulatedWidth +=
                      parentWidth * (sizes[i] / totalProportion) -
                          (i == sizes.length - 1 ? 0 : 2);
                }
                return Column(
                  children: [
                    Row(
                      children: [
                        if (arrowPosition <= 40)
                          ...[]
                        else ...[
                          SizedBox(
                            width: arrowPosition - 20,
                          )
                        ],
                        Container(
                          width: 40,
                          height:16,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Transform.rotate(
                                angle: 3.14 / 4,
                                child: Container(
                                  width: 14,
                                  height: 14,
                                  color: Color(0xff596068),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 8),
                                decoration: BoxDecoration(
                                    color: Color(0xff596068),
                                    borderRadius: BorderRadius.circular(16)),
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    currentBmi(context).formatDecimalValue,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(children: [
                      for (int i = 0; i < sizes.length; i++) ...[
                        Row(
                          children: [
                            Container(
                              width:
                                  parentWidth * (sizes[i] / totalProportion) -
                                      (i == sizes.length - 1 ? 0 : 2),
                              height: 12,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: gradientColors[i],
                                  stops: [
                                    0.03,
                                    1.0
                                  ], // Adjust the stop values to change the distribution of colors
                                ),
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.green,
                              ),
                            ),
                            Visibility(
                                visible: i != sizes.length - 1,
                                child: SizedBox(
                                  width: 2,
                                ))
                          ],
                        )
                      ]
                    ]),
                    Row(children: [
                      for (int i = 0; i < sizes.length; i++) ...[
                        Row(
                          children: [
                            if ((i == 0)) ...[
                              SizedBox(
                                // color: Colors.red,
                                width: 14,
                                child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      values[i].toString(),
                                      style: TextStyle(color: Colors.grey),
                                    )),
                              ),
                            ],
                            SizedBox(
                              width: parentWidth *
                                      (sizes[i] / totalProportion) -
                                  ((i == 0 || i == sizes.length - 1) ? 22 : 14),
                              height: 12,
                            ),
                            Visibility(
                                visible: i != sizes.length - 1,
                                child: SizedBox(
                                  // color: Colors.red,
                                  width: 14,
                                  child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Text(
                                        values[i + 1].toString(),
                                        style: TextStyle(color: Colors.grey),
                                      )),
                                )),
                            if ((i == sizes.length - 1)) ...[
                              SizedBox(
                                // color: Colors.red,
                                width: 14,
                                child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      values.last.toString(),
                                      style: TextStyle(color: Colors.grey),
                                    )),
                              ),
                            ],
                          ],
                        )
                      ]
                    ]),
                  ],
                );
              }),
            ),
            SizedBox(height: 8,),
            () {
              int currentBmiSection = findBmiSection(currentBmi(context), values);
              return Row(
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: currentBmiSection != -1
                            ? gradientColors[currentBmiSection]
                            : [Colors.grey],
                        stops: [
                          0.03,
                          1.0
                        ], // Adjust the stop values to change the distribution of colors
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(currentBmiSection != -1
                      ? classifications[currentBmiSection]
                      : "Extreme deviation")
                ],
              );
            }()
          ],
        );
  },
),
      ),
    );
  }

  int findBmiSection(double bmi, List<int> values) {
    for (int i = 0; i < values.length - 1; i++) {
      if (bmi >= values[i] && bmi < values[i + 1]) {
        return i;
      }
    }
    if (bmi < values.first) {
      return -1;
    } else {
      return -1;
    }
  }
}

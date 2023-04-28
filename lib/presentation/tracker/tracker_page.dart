import 'package:cash_manager/application/tracker/tracker_form/tracker_form_cubit.dart';
import 'package:cash_manager/application/tracker/tracker_watcher/tracker_watcher_cubit.dart';
import 'package:cash_manager/application/tracker/tracker_welcome_set/tracker_welcome_set_cubit.dart';
import 'package:cash_manager/domain/milestone/value_objects.dart';
import 'package:cash_manager/domain/tracker/tracker.dart';
import 'package:cash_manager/domain/tracker/unit_preference.dart';
import 'package:cash_manager/injection.dart';
import 'package:cash_manager/presentation/core/widgets/custom_progress_indicator.dart';
import 'package:cash_manager/presentation/core/widgets/custom_scaffold.dart';
import 'package:cash_manager/presentation/tracker/widgets/bmi_chart.dart';
import 'package:cash_manager/presentation/tracker/widgets/tracker_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackerPage extends StatelessWidget {
  TrackerPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TrackerFormCubit>(),
      child: BlocListener<TrackerFormCubit, TrackerFormState>(
        listenWhen: (p,c)=>p.authFailureSuccessOption!=c.authFailureSuccessOption,
        listener: (context, state) {
          state.authFailureSuccessOption.fold(
                  () => () {},
                  (either) => either.fold(
                      (failure) =>
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(failure.map(
                            unexpected: (_) => "Unexpected error",
                          )))), (_) {
                        context.read<TrackerWatcherCubit>().getTrackers();
              }));
        },
        child: CustomScaffold(
            title: "Growth",
            body: SizedBox(
              width: double.infinity,
              child: BlocBuilder<TrackerWatcherCubit, TrackerWatcherState>(
                builder: (context, state) {
                  return state.maybeMap(
                      loadSuccess: (state) {
                        final trackers = state.trackers;
                        if (trackers.isNotEmpty) {
                          return ListView(
                            children: [
                              SizedBox(height: 16,),
                              BmiChart(trackers: trackers),
                              SizedBox(height: 16,),
                              TrackerChart(
                                trackers: trackers,
                                isHeightTrackerChart: false,
                              ),
                              SizedBox(height: 16,),
                              TrackerChart(
                                trackers: trackers,
                                isHeightTrackerChart: true,
                              ),
                              SizedBox(height: 64,)

                            ],
                          );
                        } else {
                          return BlocProvider(
                            create: (context) =>
                                getIt<TrackerWelcomeSetCubit>(),
                            child: BlocBuilder<TrackerWelcomeSetCubit,
                                TrackerWelcomeSetState>(
                              buildWhen: (p, c) =>
                              p.showWeightForm != c.showWeightForm,
                              builder: (context, state) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.showWeightForm
                                          ? "What is your child's weight? ⚖"
                                          : "What is your child's height? 📏",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                      ),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Row(
                                      children: [
                                        Expanded(child: SizedBox()),
                                        Expanded(
                                            child: state.showWeightForm
                                                ? WeightValuePicker()
                                                : HeightValuePicker()),
                                        Expanded(
                                            child: state.showWeightForm
                                                ? WeightUnitPicker()
                                                : HeightUnitPicker()),
                                        Expanded(child: SizedBox()),
                                      ],
                                    ),
                                    Expanded(child: SizedBox()),
                                    Container(
                                      height: 40,
                                      width: double.infinity,
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 24),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(8)),
                                            backgroundColor: Color(0xfffd894f)),
                                        onPressed: () {
                                          final trackerWelcomeSetCubit =
                                          BlocProvider.of<
                                              TrackerWelcomeSetCubit>(
                                              context);
                                          if (state.showWeightForm) {
                                            final height = trackerWelcomeSetCubit
                                                .state.heightValue;
                                            final weight = trackerWelcomeSetCubit
                                                .state.weightValue;
                                            final tracker = Tracker(
                                                date: DateTime.now(),
                                                height: Measurement(
                                                    height.toDouble()),
                                                weight: Measurement(
                                                    weight.toDouble()));
                                            context.read<TrackerFormCubit>()
                                              ..initializeTracker(tracker)
                                              ..createTracker(
                                                  trackerWelcomeSetCubit
                                                      .state.heightUnit,
                                                  trackerWelcomeSetCubit
                                                      .state.weightUnit);
                                          } else {
                                            trackerWelcomeSetCubit
                                                .showWeightForm();
                                          }
                                        },
                                        child: Text(
                                          state.showWeightForm
                                              ? "Finish"
                                              : "Next",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 32,
                                    )
                                  ],
                                );
                              },
                            ),
                          );
                        }
                      },
                      loadInProgress: (_) => const CustomProgressIndicator(),
                      orElse: () => const SizedBox());
                },
              ),
            )),
      ),
    );
  }
}

class HeightUnitPicker extends StatelessWidget {
  const HeightUnitPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackerWelcomeSetCubit, TrackerWelcomeSetState>(
      builder: (context, state) {
        final List<HeightUnit> items = [HeightUnit.centimeter, HeightUnit.inch];
        return Container(
          height: 100,
          alignment: Alignment.center,
          child: CupertinoPicker(
            diameterRatio: 100,
            // Set this value to a high number
            itemExtent: 50.0,
            useMagnifier: false,
            selectionOverlay: Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(color: Colors.grey, width: 0.2))),
            ),
            scrollController: FixedExtentScrollController(),
            onSelectedItemChanged: (int index) {
              context
                  .read<TrackerWelcomeSetCubit>()
                  .heightUnitChanged(items[index]);
            },
            children: List<Widget>.generate(items.length, (int index) {
              final bool isSelected = items[index] == state.heightUnit;
              return Transform.scale(
                scale: 1,
                child: Center(
                  child: Text(
                    items[index].description.toString(),
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color:
                        isSelected ? Color(0xfffd894f) : Colors.grey[700]),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}

class HeightValuePicker extends StatelessWidget {
  HeightValuePicker({Key? key}) : super(key: key);
  final scrollController = FixedExtentScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrackerWelcomeSetCubit, TrackerWelcomeSetState>(
      listenWhen: (p, c) => p.heightUnit != c.heightUnit,
      listener: (context, state) {
        scrollController.jumpToItem(0);
      },
      builder: (context, state) {
        late final List<int> items;
        if (state.heightUnit == HeightUnit.centimeter) {
          items = List.generate(120, (index) => index + 1);
        } else {
          items = List.generate(50, (index) => index + 1);
        }
        return Container(
          height: 100,
          alignment: Alignment.center,
          child: CupertinoPicker(
            looping: true,
            diameterRatio: 100,
            // Set this value to a high number
            itemExtent: 50.0,
            useMagnifier: false,
            selectionOverlay: Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              decoration: const BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(color: Colors.grey, width: 0.2))),
            ),
            scrollController: scrollController,
            onSelectedItemChanged: (int index) {
              context
                  .read<TrackerWelcomeSetCubit>()
                  .heightValueChanged(index + 1);
            },
            children: List<Widget>.generate(items.length, (int index) {
              final bool isSelected = index == state.heightValue - 1;
              final double scale = isSelected ? 1.4 : 0.9;
              return Transform.scale(
                scale: scale,
                child: Center(
                  child: Text(
                    items[index].toString(),
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color:
                        isSelected ? Color(0xfffd894f) : Colors.grey[700]),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}

class WeightUnitPicker extends StatelessWidget {
  const WeightUnitPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackerWelcomeSetCubit, TrackerWelcomeSetState>(
      builder: (context, state) {
        final List<WeightUnit> items = [WeightUnit.kilogram, WeightUnit.pound];
        return Container(
          height: 100,
          alignment: Alignment.center,
          child: CupertinoPicker(
            diameterRatio: 100,
            // Set this value to a high number
            itemExtent: 50.0,
            useMagnifier: false,
            selectionOverlay: Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(color: Colors.grey, width: 0.2))),
            ),
            scrollController: FixedExtentScrollController(),
            onSelectedItemChanged: (int index) {
              context
                  .read<TrackerWelcomeSetCubit>()
                  .weightUnitChanged(items[index]);
            },
            children: List<Widget>.generate(items.length, (int index) {
              final bool isSelected = items[index] == state.weightUnit;
              return Transform.scale(
                scale: 1,
                child: Center(
                  child: Text(
                    items[index].description.toString(),
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color:
                        isSelected ? Color(0xfffd894f) : Colors.grey[700]),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}

class WeightValuePicker extends StatelessWidget {
  WeightValuePicker({Key? key}) : super(key: key);
  final scrollController = FixedExtentScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrackerWelcomeSetCubit, TrackerWelcomeSetState>(
      listenWhen: (p, c) => p.weightUnit != c.weightUnit,
      listener: (context, state) {
        scrollController.jumpToItem(0);
      },
      builder: (context, state) {
        late final List<int> items;
        if (state.weightUnit == WeightUnit.kilogram) {
          items = List.generate(25, (index) => index + 1);
        } else {
          items = List.generate(50, (index) => index + 1);
        }
        return Container(
          height: 100,
          alignment: Alignment.center,
          child: CupertinoPicker(
            looping: true,
            diameterRatio: 100,
            // Set this value to a high number
            itemExtent: 50.0,
            useMagnifier: false,
            selectionOverlay: Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(color: Colors.grey, width: 0.2))),
            ),
            scrollController: scrollController,
            onSelectedItemChanged: (int index) {
              context
                  .read<TrackerWelcomeSetCubit>()
                  .weightValueChanged(index + 1);
            },
            children: List<Widget>.generate(items.length, (int index) {
              final bool isSelected = index == state.weightValue - 1;
              final double scale = isSelected ? 1.4 : 0.9;
              return Transform.scale(
                scale: scale,
                child: Center(
                  child: Text(
                    items[index].toString(),
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color:
                        isSelected ? Color(0xfffd894f) : Colors.grey[700]),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}

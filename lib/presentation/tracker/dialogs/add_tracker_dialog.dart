import 'package:cash_manager/application/tracker/tracker_form/tracker_form_cubit.dart';
import 'package:cash_manager/application/tracker/tracker_watcher/tracker_watcher_cubit.dart';
import 'package:cash_manager/application/tracker/unit_preference_watcher/unit_preference_watcher_cubit.dart';
import 'package:cash_manager/domain/milestone/value_objects.dart';
import 'package:cash_manager/domain/tracker/tracker.dart';
import 'package:cash_manager/domain/tracker/unit_preference.dart';
import 'package:cash_manager/injection.dart';
import 'package:cash_manager/presentation/core/utils/unit_converter_util.dart';
import 'package:cash_manager/presentation/core/utils/unit_helpers.dart';
import 'package:cash_manager/presentation/tracker/widgets/unit_selection_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTrackerDialog extends StatelessWidget {
  const AddTrackerDialog(
      {Key? key, required this.isHeightTrackerChart, required this.lastTracker})
      : super(key: key);
  final bool isHeightTrackerChart;
  final Tracker lastTracker;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<TrackerFormCubit>()..initializeTracker(lastTracker),
      child: BlocListener<TrackerFormCubit, TrackerFormState>(
        listenWhen: (p, c) =>
            p.authFailureSuccessOption != c.authFailureSuccessOption,
        listener: (context, state) {
          state.authFailureSuccessOption.fold(
              () => () {},
              (either) => either.fold(
                      (failure) =>
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(failure.map(
                            unexpected: (_) => "Unexpected error",
                          )))), (r) {
                    Navigator.pop(context);
                  }));
        },
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BlocConsumer<TrackerFormCubit, TrackerFormState>(
              listener: (context, state) {
                state.authFailureSuccessOption.fold(
                    () => () {},
                    (either) => either.fold(
                            (failure) => ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(content:
                                        Text(failure.map(unexpected: (_) {
                                  return "Unexpected Error";
                                })))), (_) {
                          context.read<TrackerWatcherCubit>().getTrackers();
                        }));
              },
              builder: (context, trackerFormState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    BlocBuilder<UnitPreferenceWatcherCubit,
                        UnitPreferenceWatcherState>(
                      builder: (context, state) {
                        return state.maybeMap(
                            loadSuccess: (state) {
                              final unitPreference = state.unitPreference;
                              if (!isHeightTrackerChart) {
                                return Row(
                                  children: [
                                    Expanded(
                                        child: ValueFormTextField(
                                            onUnitPreferenceChanged:
                                                (controller, unitPreference) {
                                              if (unitPreference.weightUnit ==
                                                  WeightUnit.kilogram) {
                                                controller
                                                    .text = poundsToKilograms(
                                                        double.tryParse(
                                                                controller
                                                                    .text) ??
                                                            0)
                                                    .formatDecimalValue;

                                              } else {
                                                controller
                                                    .text = kilogramsToPounds(
                                                        double.tryParse(
                                                                controller
                                                                    .text) ??
                                                            0)
                                                    .formatDecimalValue;

                                              }
                                              context
                                                  .read<TrackerFormCubit>()
                                                  .trackerWeightChanged(controller.text);
                                            },
                                            initialValue:
                                                lastTracker.weight.getOrCrash(),
                                            measurementForValidation: context
                                                .read<TrackerFormCubit>()
                                                .state
                                                .tracker
                                                .weight,
                                            onChanged: (value) {
                                              context
                                                  .read<TrackerFormCubit>()
                                                  .trackerWeightChanged(value);
                                            },
                                            trackerFormCubit: BlocProvider.of<
                                                TrackerFormCubit>(context))),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    UnitSelectionWidget(
                                        weightUnit: WeightUnit.pound,
                                        unitPreference: unitPreference),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    UnitSelectionWidget(
                                        weightUnit: WeightUnit.kilogram,
                                        unitPreference: unitPreference),
                                  ],
                                );
                              } else {
                                return Row(
                                  children: [
                                    Expanded(
                                        child: ValueFormTextField(
                                            onUnitPreferenceChanged:
                                                (controller, unitPreference) {
                                              if (unitPreference.heightUnit ==
                                                  HeightUnit.centimeter) {
                                                controller
                                                    .text = inchesToCentimeters(
                                                        double.tryParse(
                                                                controller
                                                                    .text) ??
                                                            0)
                                                    .formatDecimalValue;
                                              } else {
                                                controller
                                                    .text = centimetersToInches(
                                                        double.tryParse(
                                                                controller
                                                                    .text) ??
                                                            0)
                                                    .formatDecimalValue;
                                              }
                                              context
                                                  .read<TrackerFormCubit>()
                                                  .trackerHeightChanged(controller.text);
                                            },
                                            initialValue:
                                                lastTracker.height.getOrCrash(),
                                            measurementForValidation: context
                                                .read<TrackerFormCubit>()
                                                .state
                                                .tracker
                                                .height,
                                            onChanged: (value) {
                                              context
                                                  .read<TrackerFormCubit>()
                                                  .trackerHeightChanged(value);
                                            },
                                            trackerFormCubit: BlocProvider.of<
                                                TrackerFormCubit>(context))),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    UnitSelectionWidget(
                                        heightUnit: HeightUnit.inch,
                                        unitPreference: unitPreference),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    UnitSelectionWidget(
                                        heightUnit: HeightUnit.centimeter,
                                        unitPreference: unitPreference),
                                  ],
                                );
                              }
                            },
                            orElse: () => SizedBox());
                      },
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                          height: 40,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Color(0xfffd894f)),
                            ),
                          ),
                        )),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                            child: SizedBox(
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                backgroundColor: Color(0xfffd894f)),
                            onPressed: () {
                              context
                                  .read<UnitPreferenceWatcherCubit>()
                                  .state
                                  .maybeMap(
                                      loadSuccess: (state) {
                                        final heightUnit =
                                            state.unitPreference.heightUnit;
                                        final weightUnit =
                                            state.unitPreference.weightUnit;
                                        context
                                            .read<TrackerFormCubit>()
                                            .createTracker(
                                                heightUnit, weightUnit);
                                      },
                                      orElse: () {});
                            },
                            child: Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ValueFormTextField extends StatefulWidget {
  const ValueFormTextField({
    super.key,
    required this.trackerFormCubit,
    required this.onChanged,
    required this.measurementForValidation,
    required this.initialValue,
    required this.onUnitPreferenceChanged,
  });

  final TrackerFormCubit trackerFormCubit;
  final Function(String) onChanged;
  final Function(TextEditingController, UnitPreference) onUnitPreferenceChanged;
  final Measurement measurementForValidation;
  final double initialValue;

  @override
  State<ValueFormTextField> createState() => _ValueFormTextFieldState();
}

class _ValueFormTextFieldState extends State<ValueFormTextField> {
  late final controller = TextEditingController()
    ..text = widget.initialValue.formatDecimalValue;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UnitPreferenceWatcherCubit, UnitPreferenceWatcherState>(
      listenWhen: (p, c) =>
          c.maybeMap(loadSuccess: (_) => true, orElse: () => false),
      listener: (context, state) {
        state.maybeMap(
            loadSuccess: (state) {
              widget.onUnitPreferenceChanged(controller, state.unitPreference);
            },
            orElse: () {});
      },
      child: Form(
        autovalidateMode: widget.trackerFormCubit.state.showErrorMessages
            ? AutovalidateMode.always
            : AutovalidateMode.disabled,
        child: TextFormField(
          cursorColor: Color(0xfffd894f),
          controller: controller,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
          ],
          autocorrect: false,
          validator: (_) => widget.measurementForValidation.value.fold(
              (f) => f.maybeMap(
                  isLessThanZero: (value) =>
                      'Measurement unit must be greater than zero',
                  orElse: () => null),
              (r) => null),
          onChanged: (value) => widget.onChanged(value),
          decoration: const InputDecoration(
            isCollapsed: true,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Color(
                      0xfffd894f)), // Set the underline color when TextFormField is focused
            ),
            contentPadding: EdgeInsets.only(bottom: 4),
          ),
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }

}

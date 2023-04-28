part of 'tracker_form_cubit.dart';


@freezed
abstract class TrackerFormState with _$TrackerFormState{
  factory TrackerFormState({required Tracker tracker,required bool showErrorMessages,required bool isSubmitting,required bool showPassword,required Option<Either<TrackerFailure,Unit>> authFailureSuccessOption})= _TrackerFormState;
  factory TrackerFormState.initial()=>TrackerFormState(tracker: Tracker.empty(), showErrorMessages: false,showPassword:false, isSubmitting: false,authFailureSuccessOption :none() );
}

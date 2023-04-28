part of 'intro_cubit.dart';

@freezed
class IntroState with _$IntroState {
  const factory IntroState({required bool isFirstTime}) = _IntroState;

  const IntroState._();

  factory IntroState.initial() => IntroState(isFirstTime: true);
}

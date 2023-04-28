import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cash_manager/domain/intro/i_intro_facade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'intro_state.dart';
part 'intro_cubit.freezed.dart';

@injectable
class IntroCubit extends Cubit<IntroState> {
  final IIntroFacade _introFacade;

  IntroCubit(this._introFacade) : super(IntroState.initial());

  Future<void> checkFirstTime() async {
    final isFirstTime = await _introFacade.isFirstTime();
    emit(IntroState(isFirstTime: isFirstTime));
  }

  Future<void> setFirstTime(bool value) async {
    await _introFacade.setFirstTime(value);
    emit(IntroState(isFirstTime: value));
  }
}

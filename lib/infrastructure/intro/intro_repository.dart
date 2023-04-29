import 'package:cash_manager/domain/intro/i_intro_facade.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IIntroFacade)
class IntroFacade implements IIntroFacade {
  final Box<bool> _settingBox;

  IntroFacade(
    @Named("settingBox") this._settingBox,
  );

  @override
  Future<bool> isFirstTime() async {
    final isFirstTime = _settingBox.get('is_first_time') ?? true;
    return isFirstTime;
  }

  @override
  Future<void> setFirstTime(bool value) async {
    await _settingBox.put('is_first_time', value);
  }
}

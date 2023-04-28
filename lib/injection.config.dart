// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cash_manager/application/article/article_searcher/article_searcher_cubit.dart'
    as _i25;
import 'package:cash_manager/application/article/article_watcher/article_watcher_cubit.dart'
    as _i29;
import 'package:cash_manager/application/article/fav_article_actor/fav_article_actor_cubit.dart'
    as _i26;
import 'package:cash_manager/application/article/fav_article_watcher/fav_article_cubit.dart'
    as _i27;
import 'package:cash_manager/application/intro/intro_cubit.dart' as _i17;
import 'package:cash_manager/application/milestone/milestone_actor/milestone_actor_cubit.dart'
    as _i18;
import 'package:cash_manager/application/milestone/milestone_filter/milestone_filter_cubit.dart'
    as _i19;
import 'package:cash_manager/application/milestone/milestone_watcher/milestone_watcher_cubit.dart'
    as _i20;
import 'package:cash_manager/application/tracker/tracker_form/tracker_form_cubit.dart'
    as _i21;
import 'package:cash_manager/application/tracker/tracker_watcher/tracker_watcher_cubit.dart'
    as _i28;
import 'package:cash_manager/application/tracker/tracker_welcome_set/tracker_welcome_set_cubit.dart'
    as _i22;
import 'package:cash_manager/application/tracker/unit_preference_actor/unit_preference_actor_cubit.dart'
    as _i23;
import 'package:cash_manager/application/tracker/unit_preference_watcher/unit_preference_watcher_cubit.dart'
    as _i24;
import 'package:cash_manager/domain/article/i_article_repository.dart' as _i8;
import 'package:cash_manager/domain/intro/i_intro_facade.dart' as _i10;
import 'package:cash_manager/domain/milestone/i_milestone_repository.dart'
    as _i13;
import 'package:cash_manager/domain/milestone/milestone.dart' as _i6;
import 'package:cash_manager/domain/tracker/i_tracker_repository.dart' as _i15;
import 'package:cash_manager/domain/tracker/unit_preference.dart' as _i4;
import 'package:cash_manager/infrastructure/article/article_repository.dart'
    as _i9;
import 'package:cash_manager/infrastructure/core/app_injectable_module.dart'
    as _i30;
import 'package:cash_manager/infrastructure/intro/intro_repository.dart'
    as _i11;
import 'package:cash_manager/infrastructure/milestone/milestone_repository.dart'
    as _i14;
import 'package:cash_manager/infrastructure/tracker/tracker_dto.dart' as _i5;
import 'package:cash_manager/infrastructure/tracker/tracker_repository.dart'
    as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i12;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:http/http.dart' as _i7;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appInjectableProdModule = _$AppInjectableProdModule();
    await gh.factoryAsync<_i3.Box<bool>>(
      () => appInjectableProdModule.settingBox,
      instanceName: 'settingBox',
      preResolve: true,
    );
    await gh.factoryAsync<_i3.Box<_i4.UnitPreference>>(
      () => appInjectableProdModule.unitPreferenceBox,
      instanceName: 'unitPreferenceBox',
      preResolve: true,
    );
    await gh.factoryAsync<_i3.Box<_i5.TrackerDto>>(
      () => appInjectableProdModule.trackerBox,
      instanceName: 'trackerBox',
      preResolve: true,
    );
    await gh.factoryAsync<_i3.Box<_i6.Milestone>>(
      () => appInjectableProdModule.milestoneBox,
      instanceName: 'milestoneBox',
      preResolve: true,
    );
    await gh.factoryAsync<_i3.Box<String>>(
      () => appInjectableProdModule.searchHistoryBox,
      instanceName: 'searchHistoryBox',
      preResolve: true,
    );
    await gh.factoryAsync<_i3.Box<String>>(
      () => appInjectableProdModule.favArticleBox,
      instanceName: 'favArticleUidBox',
      preResolve: true,
    );
    gh.lazySingleton<_i7.Client>(() => appInjectableProdModule.httpClient);
    gh.lazySingleton<_i8.IArticleRepository>(() => _i9.ArticleRepository(
          gh<_i3.Box<String>>(instanceName: 'favArticleUidBox'),
          gh<_i3.Box<String>>(instanceName: 'searchHistoryBox'),
        ));
    gh.lazySingleton<_i10.IIntroFacade>(
        () => _i11.IntroFacade(gh<_i12.Box<bool>>(instanceName: 'settingBox')));
    gh.lazySingleton<_i13.IMilestoneRepository>(() => _i14.MilestoneRepository(
        gh<_i3.Box<_i6.Milestone>>(instanceName: 'milestoneBox')));
    gh.lazySingleton<_i15.ITrackerRepository>(() => _i16.TrackerRepository(
          gh<_i3.Box<_i5.TrackerDto>>(instanceName: 'trackerBox'),
          gh<_i3.Box<_i4.UnitPreference>>(instanceName: 'unitPreferenceBox'),
        ));
    gh.factory<_i17.IntroCubit>(() => _i17.IntroCubit(gh<_i10.IIntroFacade>()));
    gh.factory<_i18.MilestoneActorCubit>(
        () => _i18.MilestoneActorCubit(gh<_i13.IMilestoneRepository>()));
    gh.factory<_i19.MilestoneFilterCubit>(() => _i19.MilestoneFilterCubit());
    gh.singleton<_i20.MilestoneWatcherCubit>(
        _i20.MilestoneWatcherCubit(gh<_i13.IMilestoneRepository>()));
    gh.factory<_i21.TrackerFormCubit>(
        () => _i21.TrackerFormCubit(gh<_i15.ITrackerRepository>()));
    gh.factory<_i22.TrackerWelcomeSetCubit>(
        () => _i22.TrackerWelcomeSetCubit());
    gh.factory<_i23.UnitPreferenceActorCubit>(
        () => _i23.UnitPreferenceActorCubit(gh<_i15.ITrackerRepository>()));
    gh.singleton<_i24.UnitPreferenceWatcherCubit>(
        _i24.UnitPreferenceWatcherCubit(gh<_i15.ITrackerRepository>()));
    gh.factory<_i25.ArticleSearcherCubit>(
        () => _i25.ArticleSearcherCubit(gh<_i8.IArticleRepository>()));
    gh.singleton<_i26.FavArticleActorCubit>(
        _i26.FavArticleActorCubit(gh<_i8.IArticleRepository>()));
    gh.singleton<_i27.FavArticleCubit>(
        _i27.FavArticleCubit(gh<_i8.IArticleRepository>()));
    gh.factory<_i28.TrackerWatcherCubit>(() => _i28.TrackerWatcherCubit(
          gh<_i15.ITrackerRepository>(),
          gh<_i24.UnitPreferenceWatcherCubit>(),
        ));
    gh.factory<_i29.ArticleWatcherCubit>(() => _i29.ArticleWatcherCubit(
          gh<_i8.IArticleRepository>(),
          gh<_i27.FavArticleCubit>(),
        ));
    return this;
  }
}

class _$AppInjectableProdModule extends _i30.AppInjectableProdModule {}

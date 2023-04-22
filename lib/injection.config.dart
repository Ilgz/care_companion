// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cash_manager/application/article/article_searcher/article_searcher_cubit.dart'
    as _i20;
import 'package:cash_manager/application/article/article_watcher/article_watcher_cubit.dart'
    as _i23;
import 'package:cash_manager/application/article/fav_article_actor/fav_article_actor_cubit.dart'
    as _i21;
import 'package:cash_manager/application/article/fav_article_watcher/fav_article_cubit.dart'
    as _i22;
import 'package:cash_manager/application/milestone/milestone_actor/milestone_actor_cubit.dart'
    as _i14;
import 'package:cash_manager/application/milestone/milestone_filter/milestone_filter_cubit.dart'
    as _i15;
import 'package:cash_manager/application/milestone/milestone_watcher/milestone_watcher_cubit.dart'
    as _i16;
import 'package:cash_manager/application/tracker/tracker_actor/tracker_actor_cubit.dart'
    as _i17;
import 'package:cash_manager/application/tracker/tracker_watcher/tracker_watcher_cubit.dart'
    as _i18;
import 'package:cash_manager/application/tracker/unit_preference_actor/unit_preference_actor_cubit.dart'
    as _i19;
import 'package:cash_manager/domain/article/i_article_repository.dart' as _i8;
import 'package:cash_manager/domain/milestone/i_milestone_repository.dart'
    as _i10;
import 'package:cash_manager/domain/milestone/milestone.dart' as _i4;
import 'package:cash_manager/domain/tracker/i_tracker_repository.dart' as _i12;
import 'package:cash_manager/domain/tracker/unit_preference.dart' as _i6;
import 'package:cash_manager/infrastructure/article/article_repository.dart'
    as _i9;
import 'package:cash_manager/infrastructure/core/app_injectable_module.dart'
    as _i24;
import 'package:cash_manager/infrastructure/milestone/milestone_repository.dart'
    as _i11;
import 'package:cash_manager/infrastructure/tracker/tracker_dto.dart' as _i5;
import 'package:cash_manager/infrastructure/tracker/tracker_repository.dart'
    as _i13;
import 'package:get_it/get_it.dart' as _i1;
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
    await gh.factoryAsync<_i3.Box<String>>(
      () => appInjectableProdModule.favArticleBox,
      instanceName: 'favArticleUidBox',
      preResolve: true,
    );
    await gh.factoryAsync<_i3.Box<String>>(
      () => appInjectableProdModule.searchHistoryBox,
      instanceName: 'searchHistoryBox',
      preResolve: true,
    );
    await gh.factoryAsync<_i3.Box<_i4.Milestone>>(
      () => appInjectableProdModule.milestoneBox,
      instanceName: 'milestoneBox',
      preResolve: true,
    );
    await gh.factoryAsync<_i3.Box<_i5.TrackerDto>>(
      () => appInjectableProdModule.trackerBox,
      instanceName: 'trackerBox',
      preResolve: true,
    );
    await gh.factoryAsync<_i3.Box<_i6.UnitPreference>>(
      () => appInjectableProdModule.unitPreferenceBox,
      instanceName: 'unitPreferenceBox',
      preResolve: true,
    );
    gh.lazySingleton<_i7.Client>(() => appInjectableProdModule.httpClient);
    gh.lazySingleton<_i8.IArticleRepository>(() => _i9.ArticleRepository(
          gh<_i3.Box<String>>(instanceName: 'favArticleUidBox'),
          gh<_i3.Box<String>>(instanceName: 'searchHistoryBox'),
        ));
    gh.lazySingleton<_i10.IMilestoneRepository>(() => _i11.MilestoneRepository(
        gh<_i3.Box<_i4.Milestone>>(instanceName: 'milestoneBox')));
    gh.lazySingleton<_i12.ITrackerRepository>(() => _i13.TrackerRepository(
          gh<_i3.Box<_i5.TrackerDto>>(instanceName: 'trackerBox'),
          gh<_i3.Box<_i6.UnitPreference>>(instanceName: 'unitPreferenceBox'),
        ));
    gh.factory<_i14.MilestoneActorCubit>(
        () => _i14.MilestoneActorCubit(gh<_i10.IMilestoneRepository>()));
    gh.factory<_i15.MilestoneFilterCubit>(() => _i15.MilestoneFilterCubit());
    gh.singleton<_i16.MilestoneWatcherCubit>(
        _i16.MilestoneWatcherCubit(gh<_i10.IMilestoneRepository>()));
    gh.factory<_i17.TrackerActorCubit>(
        () => _i17.TrackerActorCubit(gh<_i12.ITrackerRepository>()));
    gh.factory<_i18.TrackerWatcherCubit>(
        () => _i18.TrackerWatcherCubit(gh<_i12.ITrackerRepository>()));
    gh.factory<_i19.UnitPreferenceActorCubit>(
        () => _i19.UnitPreferenceActorCubit(gh<_i12.ITrackerRepository>()));
    gh.factory<_i20.ArticleSearcherCubit>(
        () => _i20.ArticleSearcherCubit(gh<_i8.IArticleRepository>()));
    gh.singleton<_i21.FavArticleActorCubit>(
        _i21.FavArticleActorCubit(gh<_i8.IArticleRepository>()));
    gh.singleton<_i22.FavArticleCubit>(
        _i22.FavArticleCubit(gh<_i8.IArticleRepository>()));
    gh.factory<_i23.ArticleWatcherCubit>(() => _i23.ArticleWatcherCubit(
          gh<_i8.IArticleRepository>(),
          gh<_i22.FavArticleCubit>(),
        ));
    return this;
  }
}

class _$AppInjectableProdModule extends _i24.AppInjectableProdModule {}

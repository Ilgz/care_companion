// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cash_manager/application/article/article_searcher/article_searcher_cubit.dart'
    as _i16;
import 'package:cash_manager/application/article/article_watcher/article_watcher_cubit.dart'
    as _i19;
import 'package:cash_manager/application/article/fav_article_actor/fav_article_actor_cubit.dart'
    as _i17;
import 'package:cash_manager/application/article/fav_article_watcher/fav_article_cubit.dart'
    as _i18;
import 'package:cash_manager/application/milestone/milestone_actor/milestone_actor_cubit.dart'
    as _i13;
import 'package:cash_manager/application/milestone/milestone_filter/milestone_filter_cubit.dart'
    as _i14;
import 'package:cash_manager/application/milestone/milestone_watcher/milestone_watcher_cubit.dart'
    as _i15;
import 'package:cash_manager/domain/article/i_article_repository.dart' as _i7;
import 'package:cash_manager/domain/milestone/i_milestone_repository.dart'
    as _i9;
import 'package:cash_manager/domain/milestone/milestone.dart' as _i4;
import 'package:cash_manager/domain/tracker/i_tracker_repository.dart' as _i11;
import 'package:cash_manager/infrastructure/article/article_repository.dart'
    as _i8;
import 'package:cash_manager/infrastructure/core/app_injectable_module.dart'
    as _i20;
import 'package:cash_manager/infrastructure/milestone/milestone_repository.dart'
    as _i10;
import 'package:cash_manager/infrastructure/tracker/tracker_dto.dart' as _i5;
import 'package:cash_manager/infrastructure/tracker/tracker_repository.dart'
    as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:http/http.dart' as _i6;
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
    gh.lazySingleton<_i6.Client>(() => appInjectableProdModule.httpClient);
    gh.lazySingleton<_i7.IArticleRepository>(() => _i8.ArticleRepository(
          gh<_i3.Box<String>>(instanceName: 'favArticleUidBox'),
          gh<_i3.Box<String>>(instanceName: 'searchHistoryBox'),
        ));
    gh.lazySingleton<_i9.IMilestoneRepository>(() => _i10.MilestoneRepository(
        gh<_i3.Box<_i4.Milestone>>(instanceName: 'milestoneBox')));
    gh.lazySingleton<_i11.ITrackerRepository>(() => _i12.TrackerRepository(
        gh<_i3.Box<_i5.TrackerDto>>(instanceName: 'trackerBox')));
    gh.factory<_i13.MilestoneActorCubit>(
        () => _i13.MilestoneActorCubit(gh<_i9.IMilestoneRepository>()));
    gh.factory<_i14.MilestoneFilterCubit>(() => _i14.MilestoneFilterCubit());
    gh.singleton<_i15.MilestoneWatcherCubit>(
        _i15.MilestoneWatcherCubit(gh<_i9.IMilestoneRepository>()));
    gh.factory<_i16.ArticleSearcherCubit>(
        () => _i16.ArticleSearcherCubit(gh<_i7.IArticleRepository>()));
    gh.singleton<_i17.FavArticleActorCubit>(
        _i17.FavArticleActorCubit(gh<_i7.IArticleRepository>()));
    gh.singleton<_i18.FavArticleCubit>(
        _i18.FavArticleCubit(gh<_i7.IArticleRepository>()));
    gh.factory<_i19.ArticleWatcherCubit>(() => _i19.ArticleWatcherCubit(
          gh<_i7.IArticleRepository>(),
          gh<_i18.FavArticleCubit>(),
        ));
    return this;
  }
}

class _$AppInjectableProdModule extends _i20.AppInjectableProdModule {}

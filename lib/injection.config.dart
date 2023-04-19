// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cash_manager/application/article/article_searcher/article_searcher_cubit.dart'
    as _i12;
import 'package:cash_manager/application/article/article_watcher/article_watcher_cubit.dart'
    as _i15;
import 'package:cash_manager/application/article/fav_article_actor/fav_article_actor_cubit.dart'
    as _i13;
import 'package:cash_manager/application/article/fav_article_watcher/fav_article_cubit.dart'
    as _i14;
import 'package:cash_manager/application/milestone/milestone_filter/milestone_filter_cubit.dart'
    as _i10;
import 'package:cash_manager/application/milestone/milestone_watcher/milestone_watcher_cubit.dart'
    as _i11;
import 'package:cash_manager/domain/article/i_article_repository.dart' as _i6;
import 'package:cash_manager/domain/milestone/i_milestone_repository.dart'
    as _i8;
import 'package:cash_manager/domain/milestone/milestone.dart' as _i4;
import 'package:cash_manager/infrastructure/article/article_repository.dart'
    as _i7;
import 'package:cash_manager/infrastructure/core/app_injectable_module.dart'
    as _i16;
import 'package:cash_manager/infrastructure/milestone/milestone_repository.dart'
    as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:http/http.dart' as _i5;
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
    gh.lazySingleton<_i5.Client>(() => appInjectableProdModule.httpClient);
    gh.lazySingleton<_i6.IArticleRepository>(() => _i7.ArticleRepository(
          gh<_i3.Box<String>>(instanceName: 'favArticleUidBox'),
          gh<_i3.Box<String>>(instanceName: 'searchHistoryBox'),
        ));
    gh.lazySingleton<_i8.IMilestoneRepository>(() => _i9.MilestoneRepository(
        gh<_i3.Box<_i4.Milestone>>(instanceName: 'milestoneBox')));
    gh.factory<_i10.MilestoneFilterCubit>(() => _i10.MilestoneFilterCubit());
    gh.singleton<_i11.MilestoneWatcherCubit>(
        _i11.MilestoneWatcherCubit(gh<_i8.IMilestoneRepository>()));
    gh.factory<_i12.ArticleSearcherCubit>(
        () => _i12.ArticleSearcherCubit(gh<_i6.IArticleRepository>()));
    gh.singleton<_i13.FavArticleActorCubit>(
        _i13.FavArticleActorCubit(gh<_i6.IArticleRepository>()));
    gh.singleton<_i14.FavArticleCubit>(
        _i14.FavArticleCubit(gh<_i6.IArticleRepository>()));
    gh.factory<_i15.ArticleWatcherCubit>(() => _i15.ArticleWatcherCubit(
          gh<_i6.IArticleRepository>(),
          gh<_i14.FavArticleCubit>(),
        ));
    return this;
  }
}

class _$AppInjectableProdModule extends _i16.AppInjectableProdModule {}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cash_manager/application/article/article_searcher/article_searcher_cubit.dart'
    as _i10;
import 'package:cash_manager/application/article/article_watcher/article_watcher_cubit.dart'
    as _i13;
import 'package:cash_manager/application/article/fav_article_actor/fav_article_actor_cubit.dart'
    as _i11;
import 'package:cash_manager/application/article/fav_article_watcher/fav_article_cubit.dart'
    as _i12;
import 'package:cash_manager/application/milestone/milestone_watcher/milestone_watcher_cubit.dart'
    as _i9;
import 'package:cash_manager/domain/article/i_article_repository.dart' as _i5;
import 'package:cash_manager/domain/milestone/i_milestone_repository.dart'
    as _i7;
import 'package:cash_manager/infrastructure/article/article_repository.dart'
    as _i6;
import 'package:cash_manager/infrastructure/core/app_injectable_module.dart'
    as _i14;
import 'package:cash_manager/infrastructure/milestone/milestone_repository.dart'
    as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:http/http.dart' as _i4;
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
    gh.lazySingleton<_i4.Client>(() => appInjectableProdModule.httpClient);
    gh.lazySingleton<_i5.IArticleRepository>(() => _i6.ArticleRepository(
          gh<_i3.Box<String>>(instanceName: 'favArticleUidBox'),
          gh<_i3.Box<String>>(instanceName: 'searchHistoryBox'),
        ));
    gh.lazySingleton<_i7.IMilestoneRepository>(() => _i8.MilestoneRepository());
    gh.factory<_i9.MilestoneWatcherCubit>(
        () => _i9.MilestoneWatcherCubit(gh<_i7.IMilestoneRepository>()));
    gh.factory<_i10.ArticleSearcherCubit>(
        () => _i10.ArticleSearcherCubit(gh<_i5.IArticleRepository>()));
    gh.singleton<_i11.FavArticleActorCubit>(
        _i11.FavArticleActorCubit(gh<_i5.IArticleRepository>()));
    gh.singleton<_i12.FavArticleCubit>(
        _i12.FavArticleCubit(gh<_i5.IArticleRepository>()));
    gh.factory<_i13.ArticleWatcherCubit>(() => _i13.ArticleWatcherCubit(
          gh<_i5.IArticleRepository>(),
          gh<_i12.FavArticleCubit>(),
        ));
    return this;
  }
}

class _$AppInjectableProdModule extends _i14.AppInjectableProdModule {}

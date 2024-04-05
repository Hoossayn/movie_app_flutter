// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/data.dart' as _i6;
import '../../domain/domain.dart' as _i7;
import '../../remote/remote.dart' as _i4;
import '../core.dart' as _i5;
import 'remote_module.dart' as _i8;
import 'service_module.dart' as _i9;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final remoteModule = _$RemoteModule();
  final serviceModule = _$ServiceModule();
  gh.singleton<_i3.Dio>(() => remoteModule.dio);
  gh.singleton<_i4.DioProvider>(() => remoteModule.dioProvider);
  gh.singleton<_i5.NavigationService>(() => serviceModule.navigationService);
  gh.singleton<_i4.ResponseParserHandler>(
      () => remoteModule.responseParserHandler);
  gh.singleton<_i4.TokenProvider>(() => remoteModule.tokenProvider);
  gh.factory<_i4.BaseClient>(() => _i4.BaseClientImpl(
        dio: gh<_i3.Dio>(),
        responseParserHandler: gh<_i4.ResponseParserHandler>(),
      ));
  gh.factory<_i6.BaseRepository>(
      () => _i6.BaseRepositoryImpl(baseClient: gh<_i4.BaseClient>()));
  gh.factory<_i7.PopularMoviesUseCase>(
      () => _i7.PopularMoviesUseCase(authApi: gh<_i6.BaseRepository>()));
  gh.factory<_i7.PopularTvShowsUseCase>(
      () => _i7.PopularTvShowsUseCase(authApi: gh<_i6.BaseRepository>()));
  gh.factory<_i7.TopRatedMoviesUseCase>(
      () => _i7.TopRatedMoviesUseCase(authApi: gh<_i6.BaseRepository>()));
  gh.factory<_i7.TrendingMoviesUseCase>(
      () => _i7.TrendingMoviesUseCase(authApi: gh<_i6.BaseRepository>()));
  gh.factory<_i7.UpcomingMoviesUseCase>(
      () => _i7.UpcomingMoviesUseCase(authApi: gh<_i6.BaseRepository>()));
  return getIt;
}

class _$RemoteModule extends _i8.RemoteModule {}

class _$ServiceModule extends _i9.ServiceModule {}

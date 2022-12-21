// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_package/common/model.dart' as _i11;
import 'package:core_package/core_package.dart' as _i10;
import 'package:core_router/core_router.dart' as _i5;
import 'package:dio/dio.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../src/data/home/home_model_converter.dart' as _i6;
import '../../src/data/home/home_repository.dart' as _i13;
import '../../src/data/home/home_service.dart' as _i7;
import '../../src/data/home/local_data_source.dart' as _i9;
import '../../src/data/home/remote_data_source.dart' as _i12;
import '../../src/presentation/controllers/banner/banner_controller.dart'
    as _i3;
import '../../src/presentation/controllers/home/home_controller.dart' as _i14;
import '../bridge/home_feature.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.BannerController>(() => _i3.BannerControllerImpl());
  gh.singleton<_i4.HomeFeature>(_i4.HomeFeature(get<_i5.AppRouter>()));
  gh.singleton<_i6.HomeModelConverter>(_i6.HomeModelConverter());
  gh.singleton<_i7.HomeService>(_i7.HomeService(get<_i8.Dio>()));
  gh.singleton<_i9.HomeLocalDataSource>(_i9.HomeLocalDataSource(
    get<_i6.HomeModelConverter>(),
    get<_i10.AppDatabase>(),
    get<_i11.CacheKeyGenerator>(),
  ));
  gh.singleton<_i12.HomeRemoteDataSource>(
      _i12.HomeRemoteDataSource(get<_i7.HomeService>()));
  gh.singleton<_i13.HomeRepository>(_i13.HomeRepository(
    get<_i12.HomeRemoteDataSource>(),
    get<_i9.HomeLocalDataSource>(),
  ));
  gh.factory<_i14.HomeController>(
      () => _i14.HomeControllerImpl(get<_i13.HomeRepository>()));
  return get;
}

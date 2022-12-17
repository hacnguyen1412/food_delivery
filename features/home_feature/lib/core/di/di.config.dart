// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_router/core_router.dart' as _i5;
import 'package:dio/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../../src/data/home/home_model_converter.dart' as _i6;
import '../../src/data/home/home_repository.dart' as _i12;
import '../../src/data/home/home_service.dart' as _i9;
import '../../src/data/home/local_data_source.dart' as _i7;
import '../../src/data/home/remote_data_source.dart' as _i11;
import '../../src/presentation/controllers/banner/banner_controller.dart'
    as _i3;
import '../../src/presentation/controllers/home/home_controller.dart' as _i13;
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
  gh.singleton<_i7.HomeModelDataSource>(_i7.HomeModelDataSource(
    get<_i8.SharedPreferences>(),
    get<_i6.HomeModelConverter>(),
  ));
  gh.singleton<_i9.HomeService>(_i9.HomeService(get<_i10.Dio>()));
  gh.singleton<_i11.HomeRemoteDataSource>(
      _i11.HomeRemoteDataSource(get<_i9.HomeService>()));
  gh.singleton<_i12.HomeRepository>(_i12.HomeRepository(
    get<_i11.HomeRemoteDataSource>(),
    get<_i7.HomeModelDataSource>(),
  ));
  gh.factory<_i13.HomeController>(
      () => _i13.HomeControllerImpl(get<_i12.HomeRepository>()));
  return get;
}

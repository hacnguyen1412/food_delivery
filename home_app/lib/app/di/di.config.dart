// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_data_source/core_data_source.dart' as _i9;
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../src/data/home/home_model_converter.dart' as _i4;
import '../../src/data/home/home_repository.dart' as _i8;
import '../../src/data/home/home_service.dart' as _i5;
import '../../src/data/home/remote_data_source.dart' as _i7;
import '../../src/presentation/controllers/banner/banner_controller.dart'
    as _i3;
import '../../src/presentation/controllers/home/home_controller.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i4.HomeModelConverter>(_i4.HomeModelConverter());
  gh.singleton<_i5.HomeService>(_i5.HomeService(get<_i6.Dio>()));
  gh.singleton<_i7.HomeRemoteDataSource>(
      _i7.HomeRemoteDataSource(get<_i5.HomeService>()));
  gh.singleton<_i8.HomeRepository>(_i8.HomeRepository(
    get<_i7.HomeRemoteDataSource>(),
    get<_i9.LocalDataSource>(),
    get<_i4.HomeModelConverter>(),
  ));
  gh.factory<_i10.HomeController>(
      () => _i10.HomeControllerImpl(get<_i8.HomeRepository>()));
  return get;
}

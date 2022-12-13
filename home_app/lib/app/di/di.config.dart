// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_data_source/core_data_source.dart' as _i6;
//import 'package:get_it/get_it.dart' as _i1;
import 'package:core_package/core_package.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../src/data/home/home_repository.dart' as _i5;
import '../../src/presentation/controllers/banner/banner_controller.dart'
    as _i3;
import '../../src/presentation/controllers/home/home_controller.dart' as _i7;
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
  gh.singleton<_i4.HomeFeature>(_i4.HomeFeature());
  gh.singleton<_i5.HomeRepository>(_i5.HomeRepository(
    get<_i6.RemoteDataSource<_i6.ApiService>>(),
    get<_i6.LocalDataSource>(),
  ));
  gh.factory<_i7.HomeController>(
      () => _i7.HomeControllerImpl(get<_i5.HomeRepository>()));
  return get;
}

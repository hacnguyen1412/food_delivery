// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_router/core_router.dart' as _i4;
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../../src/data/profile/profile_local_data_source.dart' as _i8;
import '../../src/data/profile/profile_model_converter.dart' as _i5;
import '../../src/data/profile/profile_remote_data_source.dart' as _i10;
import '../../src/data/profile/profile_repository.dart' as _i11;
import '../../src/data/profile/profile_service.dart' as _i6;
import '../../src/presentation/controllers/profile/profile_controller.dart'
    as _i12;
import '../bridge/profile_feature.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i3.ProfileFeature>(_i3.ProfileFeature(get<_i4.AppRouter>()));
  gh.singleton<_i5.ProfileModelConverter>(_i5.ProfileModelConverter());
  gh.singleton<_i6.ProfileService>(_i6.ProfileService(get<_i7.Dio>()));
  gh.singleton<_i8.ProfileLocalDataSource>(_i8.ProfileLocalDataSource(
    get<_i9.SharedPreferences>(),
    get<_i5.ProfileModelConverter>(),
  ));
  gh.singleton<_i10.ProfileRemoteDataSource>(
      _i10.ProfileRemoteDataSource(get<_i6.ProfileService>()));
  gh.singleton<_i11.ProfileRepository>(_i11.ProfileRepository(
    get<_i10.ProfileRemoteDataSource>(),
    get<_i8.ProfileLocalDataSource>(),
  ));
  gh.factory<_i12.ProfileController>(
      () => _i12.ProfileControllerImpl(get<_i11.ProfileRepository>()));
  return get;
}

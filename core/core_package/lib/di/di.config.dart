// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_dependency/core_dependency.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../common/model.dart' as _i4;
import '../src/auth/data/repository/auth_local_data_source.dart' as _i7;
import '../src/auth/data/repository/auth_remote_data_source.dart' as _i3;
import '../src/auth/data/repository/auth_service.dart' as _i10;
import '../src/auth/data/repository/auto_repository_impl.dart' as _i9;
import '../src/auth/domain/repository/auth_repository.dart' as _i8;
import '../src/auth/domain/use_case/auth_use_case.dart' as _i14;
import '../src/auth/domain/use_case/cache_auth_use_case.dart' as _i11;
import '../src/auth/domain/use_case/check_auth_use_case.dart' as _i12;
import '../src/auth/domain/use_case/get_auth_use_case.dart' as _i13;
import '../src/auth/test_presentation/auth_controller.dart' as _i15;
import '../src/object_box/object_box.dart' as _i6;
import 'dio_module.dart' as _i16;
import 'event_bus_module.dart' as _i17;
import 'object_box_module.dart' as _i18; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final dIOModule = _$DIOModule();
  final eventBusModule = _$EventBusModule();
  final objectBoxModule = _$ObjectBoxModule();
  gh.singleton<_i3.AuthRemoteDataSource>(_i3.AuthRemoteDataSource());
  gh.singleton<_i4.CacheKeyGenerator>(_i4.CacheKeyGenerator());
  gh.lazySingleton<_i5.Dio>(() => dIOModule.dio());
  gh.lazySingleton<_i5.EventBus>(() => eventBusModule.eventBus());
  await gh.lazySingletonAsync<_i6.ObjectBoxFactory>(
    () => objectBoxModule.objectBoxFactory,
    preResolve: true,
  );
  gh.singleton<_i7.AuthLocalDataSource>(
      _i7.AuthLocalDataSource(get<_i6.ObjectBoxFactory>()));
  gh.singleton<_i8.AuthRepository>(_i9.AuthRepositoryImpl(
    get<_i7.AuthLocalDataSource>(),
    get<_i3.AuthRemoteDataSource>(),
  ));
  gh.singleton<_i10.AuthService>(_i10.AuthService(get<_i5.Dio>()));
  gh.singleton<_i11.CacheAuthUserCase>(
      _i11.CacheAuthUserCase(get<_i8.AuthRepository>()));
  gh.singleton<_i12.CheckAuthUseCase>(
      _i12.CheckAuthUseCase(get<_i8.AuthRepository>()));
  gh.singleton<_i13.GetAuthUseCase>(
      _i13.GetAuthUseCase(get<_i8.AuthRepository>()));
  gh.singleton<_i14.AuthUseCase>(_i14.AuthUseCase(
    cacheAuth: get<_i11.CacheAuthUserCase>(),
    checkAuth: get<_i12.CheckAuthUseCase>(),
    getAuth: get<_i13.GetAuthUseCase>(),
  ));
  gh.singleton<_i15.AuthController>(
      _i15.AuthController(get<_i14.AuthUseCase>()));
  return get;
}

class _$DIOModule extends _i16.DIOModule {}

class _$EventBusModule extends _i17.EventBusModule {}

class _$ObjectBoxModule extends _i18.ObjectBoxModule {}

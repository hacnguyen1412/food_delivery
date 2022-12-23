// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_dependency/core_dependency.dart' as _i6;
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../common/model.dart' as _i4;
import '../src/auth/data/repository/auth_local_data_source.dart' as _i10;
import '../src/auth/data/repository/auth_remote_data_source.dart' as _i3;
import '../src/auth/data/repository/auth_service.dart' as _i13;
import '../src/auth/data/repository/auto_repository_impl.dart' as _i12;
import '../src/auth/domain/repository/auth_repository.dart' as _i11;
import '../src/database/database.dart' as _i9;
import '../src/object_box/object_box.dart' as _i7;
import 'dio_module.dart' as _i14;
import 'event_bus_module.dart' as _i15;
import 'object_box_module.dart' as _i16;
import 'shared_preferences_module.dart'
    as _i17; // ignore_for_file: unnecessary_lambdas

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
  final sharedPreferencesModule = _$SharedPreferencesModule();
  gh.singleton<_i3.AuthRemoteDataSource>(_i3.AuthRemoteDataSource());
  gh.singleton<_i4.CacheKeyGenerator>(_i4.CacheKeyGenerator());
  gh.lazySingleton<_i5.Dio>(() => dIOModule.dio());
  gh.lazySingleton<_i6.EventBus>(() => eventBusModule.eventBus());
  await gh.lazySingletonAsync<_i7.ObjectBoxFactory>(
    () => objectBoxModule.objectBoxFactory,
    preResolve: true,
  );
  await gh.factoryAsync<_i8.SharedPreferences>(
    () => sharedPreferencesModule.prefs,
    preResolve: true,
  );
  gh.singleton<_i9.AppDatabase>(
      _i9.AppDatabaseImpl(get<_i8.SharedPreferences>()));
  gh.singleton<_i10.AuthLocalDataSource>(
      _i10.AuthLocalDataSource(get<_i7.ObjectBoxFactory>()));
  gh.singleton<_i11.AuthRepository>(_i12.AuthRepositoryImpl(
    get<_i10.AuthLocalDataSource>(),
    get<_i3.AuthRemoteDataSource>(),
  ));
  gh.singleton<_i13.AuthService>(_i13.AuthService(get<_i5.Dio>()));
  return get;
}

class _$DIOModule extends _i14.DIOModule {}

class _$EventBusModule extends _i15.EventBusModule {}

class _$ObjectBoxModule extends _i16.ObjectBoxModule {}

class _$SharedPreferencesModule extends _i17.SharedPreferencesModule {}

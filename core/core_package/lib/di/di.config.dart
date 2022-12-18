// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_dependency/core_dependency.dart' as _i5;
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../src/auth/data_source/auth_local_data_source.dart' as _i7;
import '../src/auth/model/auth_model_converter.dart' as _i3;
import 'dio_module.dart' as _i8;
import 'event_bus_module.dart' as _i9;
import 'shared_preferences_module.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

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
  final sharedPreferencesModule = _$SharedPreferencesModule();
  gh.singleton<_i3.AuthModelConverter>(_i3.AuthModelConverter());
  gh.lazySingleton<_i4.Dio>(() => dIOModule.dio());
  gh.lazySingleton<_i5.EventBus>(() => eventBusModule.eventBus());
  await gh.factoryAsync<_i6.SharedPreferences>(
    () => sharedPreferencesModule.prefs,
    preResolve: true,
  );
  gh.singleton<_i7.AuthLocalDataSource>(
      _i7.AuthLocalDataSource(get<_i6.SharedPreferences>()));
  return get;
}

class _$DIOModule extends _i8.DIOModule {}

class _$EventBusModule extends _i9.EventBusModule {}

class _$SharedPreferencesModule extends _i10.SharedPreferencesModule {}

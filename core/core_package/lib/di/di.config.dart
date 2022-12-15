// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../src/data_source/local_data_source.dart' as _i5;
import 'dio_module.dart' as _i6;
import 'shared_preferences_module.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

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
  final sharedPreferencesModule = _$SharedPreferencesModule();
  gh.lazySingleton<_i3.Dio>(() => dIOModule.dio());
  await gh.factoryAsync<_i4.SharedPreferences>(
    () => sharedPreferencesModule.prefs,
    preResolve: true,
  );
  gh.singleton<_i5.LocalDataSource>(
      _i5.LocalDataSource(get<_i4.SharedPreferences>()));
  return get;
}

class _$DIOModule extends _i6.DIOModule {}

class _$SharedPreferencesModule extends _i7.SharedPreferencesModule {}

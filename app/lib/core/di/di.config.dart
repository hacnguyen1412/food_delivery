// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_dependency/core_dependency.dart' as _i5;
import 'package:core_router/core_router.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:home_feature/core/bridge/home_feature.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:profile_feature/core/bridge/profile_feature.dart' as _i7;

import '../controller/controller_hub.dart'
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
  gh.singleton<_i3.ControllerHub>(_i3.ControllerHubImpl(
    get<_i4.AppRouter>(),
    get<_i5.EventBus>(),
    get<_i6.HomeFeature>(),
    get<_i7.ProfileFeature>(),
  ));
  return get;
}

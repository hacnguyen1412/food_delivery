// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_package/core_package.dart' as _i6;
import 'package:core_router/core_router.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../src/data/profile/model/profile_model_converter.dart' as _i7;
import '../../src/data/shipping_address/repository_impl/shipping_address_repository_impl.dart'
    as _i10;
import '../../src/data/shipping_address/repository_impl/shipping_address_rest_client.dart'
    as _i8;
import '../../src/domain/repository/shipping_address_repository.dart' as _i9;
import '../../src/domain/use_case/shipping_address/cache_shipping_address_use_case.dart'
    as _i11;
import '../../src/domain/use_case/shipping_address/fetch_shipping_address_use_case.dart'
    as _i12;
import '../../src/domain/use_case/shipping_address/get_shipping_address_cached_use_case.dart'
    as _i13;
import '../../src/presentation/controllers/profile/profile_controller.dart'
    as _i14;
import '../../src/presentation/controllers/shipping_address/shipping_address_controller.dart'
    as _i15;
import '../bridge/profile_feature.dart' as _i3;
import '../realm/realm.dart' as _i5; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i5.ProfileFeatureRealm>(
      _i5.ProfileFeatureRealm(get<_i6.AppDirectory>()));
  gh.singleton<_i7.ProfileModelConverter>(_i7.ProfileModelConverter());
  gh.singleton<_i8.ShippingAddressRestClient>(
      _i8.ShippingAddressRestClient(get<_i6.Dio>()));
  gh.singleton<_i9.ShippingAddressRepository>(
      _i10.ShippingAddressRepositoryImpl(
    get<_i8.ShippingAddressRestClient>(),
    get<_i5.ProfileFeatureRealm>(),
  ));
  gh.singleton<_i11.CacheShippingAddressesUseCase>(
      _i11.CacheShippingAddressesUseCase(get<_i9.ShippingAddressRepository>()));
  gh.singleton<_i12.FetchShippingAddressesUseCase>(
      _i12.FetchShippingAddressesUseCase(get<_i9.ShippingAddressRepository>()));
  gh.singleton<_i13.GetShippingAddressCachedUseCase>(
      _i13.GetShippingAddressCachedUseCase(
          get<_i9.ShippingAddressRepository>()));
  gh.factory<_i14.ProfileController>(() => _i14.ProfileControllerImpl(
        get<_i12.FetchShippingAddressesUseCase>(),
        get<_i11.CacheShippingAddressesUseCase>(),
      ));
  gh.factory<_i15.ShippingAddressController>(() =>
      _i15.ShippingAddressControllerImpl(
          get<_i13.GetShippingAddressCachedUseCase>()));
  return get;
}

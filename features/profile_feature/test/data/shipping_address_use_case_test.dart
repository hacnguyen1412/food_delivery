import 'package:core_dependency/core_dependency.dart' hide test;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:profile_feature/core/realm/realm.dart';
import 'package:profile_feature/src/data/shipping_address/model/shipping_address_dto.dart';
import 'package:profile_feature/src/data/shipping_address/repository_impl/shipping_address_repository_impl.dart';
import 'package:profile_feature/src/data/shipping_address/repository_impl/shipping_address_rest_client.dart';
import 'package:profile_feature/src/domain/repository/shipping_address_repository.dart';
import 'package:profile_feature/src/domain/use_case/shipping_address/cache_shipping_address_use_case.dart';
import 'package:profile_feature/src/domain/use_case/shipping_address/fetch_shipping_address_use_case.dart';
import 'package:profile_feature/src/domain/use_case/shipping_address/get_shipping_address_cached_use_case.dart';

class MockShippingAddressRestClient extends Mock
    implements ShippingAddressRestClient {}

class MockRealm extends Mock implements ProfileFeatureRealm {}

void main() {
  late MockShippingAddressRestClient restClient;
  late MockRealm realm;
  late ShippingAddressRepository repository;
  late FetchShippingAddressesUseCase fetchAddress;
  late CacheShippingAddressesUseCase cacheAddress;
  late GetShippingAddressCachedUseCase getAddress;

  setUpAll(() {
    restClient = MockShippingAddressRestClient();
    realm = MockRealm();
    repository = ShippingAddressRepositoryImpl(
      restClient,
      realm,
    );
    fetchAddress = FetchShippingAddressesUseCase(repository);
    cacheAddress = CacheShippingAddressesUseCase(repository);
    getAddress = GetShippingAddressCachedUseCase(repository);
  });

  group("Shipping address - use case: ", () {
    test("fetchAddress success", () async {
      when(restClient.fetchShippingAddress()).thenAnswer(
        (_) async => [
          ShippingAddressDto("101", "16, an nho 15"),
        ],
      );
      final result = await fetchAddress.execute();
      expect(result, isA<Success>());
    });
  });
}

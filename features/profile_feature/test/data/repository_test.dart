import 'package:core_dependency/core_dependency.dart' hide test;
import 'package:core_package/core_package.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile_feature/core/realm/realm.dart';
import 'package:profile_feature/src/data/shipping_address/model/shipping_address_dto.dart';
import 'package:profile_feature/src/data/shipping_address/repository_impl/shipping_address_repository_impl.dart';
import 'package:profile_feature/src/data/shipping_address/repository_impl/shipping_address_rest_client.dart';

import 'resource_test.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDirectory = await AppDirectory.getInstance();
  final remoteDataSource = ShippingAddressRestClient(dio);
  final localDataSource = ProfileFeatureRealm(appDirectory);
  final repository =
      ShippingAddressRepositoryImpl(remoteDataSource, localDataSource);
  group("Shipping address - Repository: ", () {
    test("Shipping ", () async {
      final result = await repository.fetchAddresses();
      expect(result, isA<List<ShippingAddressDto>>());
    });
  });
}

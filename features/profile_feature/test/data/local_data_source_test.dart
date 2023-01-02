import 'package:flutter_test/flutter_test.dart';
import 'package:profile_feature/src/data/shipping_address/model/shipping_address_dao.dart';
import 'package:profile_feature/src/domain/model/shipping_address.dart';

void main() {
  test("Convert address to dao success", () {
    const id = "123";
    const addressString = "405 nguyen ke";
    final ShippingAddress address =
        ShippingAddress(id: id, address: addressString);
    final result = address.toDao();
    final addressDao = ShippingAddressDao(id, address: addressString);
    expect(result.id, addressDao.id);
    expect(result.address, addressDao.address);
  });
}

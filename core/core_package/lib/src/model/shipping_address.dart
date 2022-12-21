import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/common/model.dart';

part 'shipping_address.g.dart';

@JsonSerializable()
class ShippingAddressModel implements Model {
  final String id;
  final String address;

  ShippingAddressModel({
    required this.id,
    required this.address,
  });

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ShippingAddressModelToJson(this);
}

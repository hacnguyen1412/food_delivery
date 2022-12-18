import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/src/model/shipping_address.dart';

class LogoutEvent extends AppEvent {
  @override
  List<Object?> get props => [];
}

class OpenShippingAddressDetailEvent extends AppEvent {
  final String shippingId;

  const OpenShippingAddressDetailEvent({
    required this.shippingId,
  });

  @override
  List<Object?> get props => [shippingId];
}

class OnSelectedShippingAddressEvent extends AppEvent {
  final ShippingAddressModel shippingAddress;

  const OnSelectedShippingAddressEvent(this.shippingAddress);

  @override
  List<Object?> get props => [shippingAddress];
}

import 'package:core_package/core_package.dart';
import 'package:home_app/main.dart';

@singleton
class HomeFeature {
  final Widget root = const HomeApp();
  final HomeAppController controller = HomeAppController();
}

class HomeAppController {}

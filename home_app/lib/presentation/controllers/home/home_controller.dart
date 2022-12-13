import 'package:core_package/core_package.dart';

abstract class HomeController {}

@Injectable(as: HomeController)
class BannerControllerImpl extends HomeController {}

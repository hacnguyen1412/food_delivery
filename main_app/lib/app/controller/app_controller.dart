import 'package:core_package/core_package.dart';
import 'package:home_app/home_app.dart';

abstract class AppController {}

@Singleton(as: AppController)
class AppControllerImpl extends AppController {}

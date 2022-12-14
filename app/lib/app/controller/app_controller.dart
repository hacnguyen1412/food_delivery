import 'package:core_package/core_package.dart';

abstract class AppController {}

@Singleton(as: AppController)
class AppControllerImpl extends AppController {}

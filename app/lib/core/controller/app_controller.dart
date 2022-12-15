import 'package:core_dependency/core_dependency.dart';

abstract class AppController {}

@Singleton(as: AppController)
class AppControllerImpl extends AppController {}

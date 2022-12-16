import 'package:core_dependency/core_dependency.dart';

@module
abstract class EventBusModule {
  @lazySingleton
  EventBus eventBus() {
    return EventBus();
  }
}

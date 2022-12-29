import 'package:core_realm/core_realm.dart';

abstract class Database {
  CoreRealm? get appRealm;
  Configuration get config;
}

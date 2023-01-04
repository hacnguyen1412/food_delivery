import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:realm/realm.dart';

abstract class CoreRealm {
  final String realmPath;

  @protected
  Realm? realm;

  CoreRealm({required this.realmPath}) {
    _openRealm();
  }

  Configuration get config;

  void add(RealmObject object, {bool update = true});

  void addAll(List<RealmObject> objects, {bool update = true});

  T? get<T extends RealmObject>({String? primaryKey});

  RealmResults<T>? getList<T extends RealmObject>();

  void deleteAll();

  void deleteMany<T extends RealmObject>(List<T> items);

  void _openRealm() {
    debugPrint("realm path: ${config.path}");
    try {
      realm = Realm(config);
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      if (kReleaseMode) {
        Realm.deleteRealm(config.path);
        realm = Realm(config);
      }
    }
  }
}

mixin CoreRealmImpl on CoreRealm {
  @override
  void add(RealmObject object, {bool update = true}) {
    realm?.write(() {
      realm?.add(
        object,
        update: update,
      );
    });
  }

  @override
  void addAll(List<RealmObject> objects, {bool update = true}) {
    realm?.write(() {
      realm?.addAll(objects, update: update);
    });
  }

  @override
  T? get<T extends RealmObject>({
    String? primaryKey,
  }) {
    T? result;
    if (primaryKey != null) {
      result = realm?.find<T>(primaryKey);
    } else {
      result = realm?.all<T>().first;
    }
    return result;
  }

  @override
  RealmResults<T>? getList<T extends RealmObject>() {
    final result = realm?.all<T>();
    return result;
  }

  @override
  void deleteAll() {
    realm?.write(() {
      realm?.deleteAll();
    });
  }

  @override
  void deleteMany<T extends RealmObject>(List<T> items) {
    realm?.write(() {
      realm?.deleteMany(items);
    });
  }
}

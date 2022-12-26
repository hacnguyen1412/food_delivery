import 'package:core_package/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

const int defaultId = 1;

class ObjectBoxFactory {
  late final Store _store;

  ObjectBoxFactory._init(this._store);

  static Future<ObjectBoxFactory> init() async {
    final dir = await getApplicationDocumentsDirectory();
    final store = openStore(directory: "${dir.path}/objectbox");
    return ObjectBoxFactory._init(store);
  }

  ObjectBox<T> createObjectBox<T>() {
    return _ObjectBoxImpl<T>(_store);
  }
}

abstract class ObjectBox<T> {
  int put(T object, {IPutMode mode = IPutMode.put});
  Future<int> putAsync(T object, {IPutMode mode = IPutMode.put});
  List<int> putMany(List<T> objects, {IPutMode mode = IPutMode.put});
  List<T> getAll();
  T? get(int id);
  bool isEmpty();
  List<T?> getMany(List<int> ids, {bool growableResult = false});
  bool remove(int id);
  int removeMany(List<int> ids);
  int removeAll();
}

class _ObjectBoxImpl<T> extends ObjectBox<T> {
  final Store store;
  late final Box<T> box = store.box<T>();

  _ObjectBoxImpl(this.store);

  @override
  int put(T object, {IPutMode mode = IPutMode.put}) {
    return box.put(object, mode: mode.putMode);
  }

  @override
  Future<int> putAsync(T object, {IPutMode mode = IPutMode.put}) {
    return box.putAsync(object, mode: mode.putMode);
  }

  @override
  List<int> putMany(List<T> objects, {IPutMode mode = IPutMode.put}) {
    return box.putMany(objects, mode: mode.putMode);
  }

  @override
  List<T> getAll() {
    return box.getAll();
  }

  @override
  T? get(int id) {
    return box.get(id);
  }

  @override
  bool isEmpty() {
    return box.isEmpty();
  }

  @override
  List<T?> getMany(List<int> ids, {bool growableResult = false}) {
    return box.getMany(ids, growableResult: growableResult);
  }

  @override
  bool remove(int id) {
    return box.remove(id);
  }

  @override
  int removeAll() {
    return box.removeAll();
  }

  @override
  int removeMany(List<int> ids) {
    return box.removeMany(ids);
  }
}

enum IPutMode {
  /// Insert (if given object's ID is zero) or update an existing object.
  put,

  /// Insert a new object.
  insert,

  /// Update an existing object, fails if the given ID doesn't exist.
  update,
}

extension IPutModeExtension on IPutMode {
  PutMode get putMode {
    PutMode result;
    switch (this) {
      case IPutMode.put:
        result = PutMode.put;
        break;
      case IPutMode.insert:
        result = PutMode.insert;
        break;
      case IPutMode.update:
        result = PutMode.update;
        break;
      default:
        throw UnimplementedError();
    }
    return result;
  }
}

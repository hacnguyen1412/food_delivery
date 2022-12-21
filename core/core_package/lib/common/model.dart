// convert json to model for cache func
import 'package:core_dependency/core_dependency.dart';

abstract class ModelConverter<T extends DatabaseModel> {
  Future<T> fromJson(Map<String, dynamic> json);
}

// abstract for cache func
abstract class DatabaseModel {
  final String? _id;

  String get id => _id ?? "";

  DatabaseModel(this._id);

  Map<String, dynamic> toJson();
}

// generate cache key for cache func

@singleton
class CacheKeyGenerator {
  String genKey<T extends DatabaseModel>({String? id}) {
    final type = T.toString();
    if (id == null) {
      return "$type}";
    } else {
      return "$type-$id";
    }
  }
}

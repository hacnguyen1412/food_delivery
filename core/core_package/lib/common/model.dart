abstract class ModelConverter<T> {
  Future<T> fromJson(Map<String, dynamic> json);
  static Type typeOf<T>() => T;
}

//abstract for cache func
abstract class Model {
  final String? _id;

  String get id => _id ?? "";

  Model(this._id);

  Map<String, dynamic> toJson();

  static String genCacheKey({required String runtimeType, String? id}) {
    if (id == null) {
      return "$runtimeType}";
    } else {
      return "$runtimeType-$id";
    }
  }
}

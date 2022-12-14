abstract class ModelConverter<T> {
  Future<T> fromJson(Map<String, dynamic> json);
  static Type typeOf<T>() => T;
}

abstract class Model {
  Model();
  Model.fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}

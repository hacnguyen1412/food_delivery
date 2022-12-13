abstract class ModelConverter<T> {
  T fromJson(Map<String, dynamic> json);
  static Type typeOf<T>() => T;
}

abstract class Model {
  Model.fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson() => throw UnimplementedError();
}

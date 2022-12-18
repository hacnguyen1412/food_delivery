class AuthModel {
  final String token;
  final String refreshToken;

  AuthModel({required this.token, required this.refreshToken});

  // @override
  // Map<String, dynamic> toJson() => _$AuthModelToJson(this);

  @override
  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      AuthModel(token: "token", refreshToken: "refreshToken");
}

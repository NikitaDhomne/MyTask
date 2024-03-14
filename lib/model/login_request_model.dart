class LoginRequest {
  String? email;
  String? password;
  String? role;
  String? deviceToken;
  String? type;
  String? socialId;

  LoginRequest(
      {this.email,
      this.password,
      this.role,
      this.deviceToken,
      this.type,
      this.socialId});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["password"] is String) {
      password = json["password"];
    }
    if (json["role"] is String) {
      role = json["role"];
    }
    if (json["device_token"] is String) {
      deviceToken = json["device_token"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["social_id"] is String) {
      socialId = json["social_id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["email"] = email;
    _data["password"] = password;
    _data["role"] = role;
    _data["device_token"] = deviceToken;
    _data["type"] = type;
    _data["social_id"] = socialId;
    return _data;
  }
}

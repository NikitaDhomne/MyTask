class RegisterResponse {
  String? success;
  String? message;
  String? token;

  RegisterResponse({this.success, this.message, this.token});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    if (json["success"] is String) {
      success = json["success"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["token"] is String) {
      token = json["token"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["message"] = message;
    _data["token"] = token;
    return _data;
  }
}

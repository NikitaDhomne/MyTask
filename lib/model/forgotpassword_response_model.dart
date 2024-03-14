class ForgotPasswordResponse {
  String? success;
  String? message;

  ForgotPasswordResponse({this.success, this.message});

  ForgotPasswordResponse.fromJson(Map<String, dynamic> json) {
    if (json["success"] is String) {
      success = json["success"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["message"] = message;
    return _data;
  }
}

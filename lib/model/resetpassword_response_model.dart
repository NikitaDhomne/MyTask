class ResetPasswordResponse {
  String? success;
  String? message;
  String? isVerified;

  ResetPasswordResponse({this.success, this.message, this.isVerified});

  ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    if (json["success"] is String) {
      success = json["success"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["is_verified"] is String) {
      isVerified = json["is_verified"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["message"] = message;
    _data["is_verified"] = isVerified;
    return _data;
  }
}

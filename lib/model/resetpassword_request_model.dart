class ResetPasswordRequest {
  String? token;
  String? password;
  String? cpassword;

  ResetPasswordRequest({this.token, this.password, this.cpassword});

  ResetPasswordRequest.fromJson(Map<String, dynamic> json) {
    if (json["token"] is String) {
      token = json["token"];
    }
    if (json["password"] is String) {
      password = json["password"];
    }
    if (json["cpassword"] is String) {
      cpassword = json["cpassword"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["token"] = token;
    _data["password"] = password;
    _data["cpassword"] = cpassword;
    return _data;
  }
}

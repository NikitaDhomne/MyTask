class ForgotPasswordRequest {
  String? mobile;

  ForgotPasswordRequest({this.mobile});

  ForgotPasswordRequest.fromJson(Map<String, dynamic> json) {
    if (json["mobile"] is String) {
      mobile = json["mobile"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["mobile"] = mobile;
    return _data;
  }
}

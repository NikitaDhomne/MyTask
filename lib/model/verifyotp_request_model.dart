
class VerifyOtpRequest {
  String? otp;

  VerifyOtpRequest({this.otp});

  VerifyOtpRequest.fromJson(Map<String, dynamic> json) {
    if(json["otp"] is String) {
      otp = json["otp"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["otp"] = otp;
    return _data;
  }
}
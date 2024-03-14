class RegisterRequest {
  String? fullName;
  String? email;
  String? phone;
  String? password;
  String? role;
  String? businessName;
  String? informalName;
  String? address;
  String? city;
  String? state;
  int? zipCode;
  String? registrationProof;
  BusinessHours? businessHours;
  String? deviceToken;
  String? type;
  String? socialId;

  RegisterRequest(
      {this.fullName,
      this.email,
      this.phone,
      this.password,
      this.role,
      this.businessName,
      this.informalName,
      this.address,
      this.city,
      this.state,
      this.zipCode,
      this.registrationProof,
      this.businessHours,
      this.deviceToken,
      this.type,
      this.socialId});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    if (json["full_name"] is String) {
      fullName = json["full_name"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["phone"] is String) {
      phone = json["phone"];
    }
    if (json["password"] is String) {
      password = json["password"];
    }
    if (json["role"] is String) {
      role = json["role"];
    }
    if (json["business_name"] is String) {
      businessName = json["business_name"];
    }
    if (json["informal_name"] is String) {
      informalName = json["informal_name"];
    }
    if (json["address"] is String) {
      address = json["address"];
    }
    if (json["city"] is String) {
      city = json["city"];
    }
    if (json["state"] is String) {
      state = json["state"];
    }
    if (json["zip_code"] is int) {
      zipCode = json["zip_code"];
    }
    if (json["registration_proof"] is String) {
      registrationProof = json["registration_proof"];
    }
    if (json["business_hours"] is Map) {
      businessHours = json["business_hours"] == null
          ? null
          : BusinessHours.fromJson(json["business_hours"]);
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
    _data["full_name"] = fullName;
    _data["email"] = email;
    _data["phone"] = phone;
    _data["password"] = password;
    _data["role"] = role;
    _data["business_name"] = businessName;
    _data["informal_name"] = informalName;
    _data["address"] = address;
    _data["city"] = city;
    _data["state"] = state;
    _data["zip_code"] = zipCode;
    _data["registration_proof"] = registrationProof;
    if (businessHours != null) {
      _data["business_hours"] = businessHours?.toJson();
    }
    _data["device_token"] = deviceToken;
    _data["type"] = type;
    _data["social_id"] = socialId;
    return _data;
  }
}

class BusinessHours {
  List<String>? mon;
  List<String>? tue;
  List<String>? wed;
  List<String>? thu;
  List<String>? fri;
  List<String>? sat;
  List<String>? sun;

  BusinessHours(
      {this.mon, this.tue, this.wed, this.thu, this.fri, this.sat, this.sun});

  BusinessHours.fromJson(Map<String, dynamic> json) {
    if (json["mon"] is List) {
      mon = json["mon"] == null ? null : List<String>.from(json["mon"]);
    }
    if (json["tue"] is List) {
      tue = json["tue"] == null ? null : List<String>.from(json["tue"]);
    }
    if (json["wed"] is List) {
      wed = json["wed"] == null ? null : List<String>.from(json["wed"]);
    }
    if (json["thu"] is List) {
      thu = json["thu"] == null ? null : List<String>.from(json["thu"]);
    }
    if (json["fri"] is List) {
      fri = json["fri"] == null ? null : List<String>.from(json["fri"]);
    }
    if (json["sat"] is List) {
      sat = json["sat"] == null ? null : List<String>.from(json["sat"]);
    }
    if (json["sun"] is List) {
      sun = json["sun"] == null ? null : List<String>.from(json["sun"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (mon != null) {
      _data["mon"] = mon;
    }
    if (tue != null) {
      _data["tue"] = tue;
    }
    if (wed != null) {
      _data["wed"] = wed;
    }
    if (thu != null) {
      _data["thu"] = thu;
    }
    if (fri != null) {
      _data["fri"] = fri;
    }
    if (sat != null) {
      _data["sat"] = sat;
    }
    if (sun != null) {
      _data["sun"] = sun;
    }
    return _data;
  }
}

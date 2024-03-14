class LoginResponse {
  bool? success;
  String? message;
  String? token;
  User? user;
  AccountPreference? accountPreference;
  NotificationSettings? notificationSettings;
  bool? isVerified;

  LoginResponse(
      {this.success,
      this.message,
      this.token,
      this.user,
      this.accountPreference,
      this.notificationSettings,
      this.isVerified});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) {
      success = json["success"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["token"] is String) {
      token = json["token"];
    }
    if (json["user"] is Map) {
      user = json["user"] == null ? null : User.fromJson(json["user"]);
    }
    if (json["account_preference"] is Map) {
      accountPreference = json["account_preference"] == null
          ? null
          : AccountPreference.fromJson(json["account_preference"]);
    }
    if (json["notification_settings"] is Map) {
      notificationSettings = json["notification_settings"] == null
          ? null
          : NotificationSettings.fromJson(json["notification_settings"]);
    }
    if (json["is_verified"] is bool) {
      isVerified = json["is_verified"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["message"] = message;
    _data["token"] = token;
    if (user != null) {
      _data["user"] = user?.toJson();
    }
    if (accountPreference != null) {
      _data["account_preference"] = accountPreference?.toJson();
    }
    if (notificationSettings != null) {
      _data["notification_settings"] = notificationSettings?.toJson();
    }
    _data["is_verified"] = isVerified;
    return _data;
  }
}

class NotificationSettings {
  String? notificationSettings;
  String? minBidThreshold;

  NotificationSettings({this.notificationSettings, this.minBidThreshold});

  NotificationSettings.fromJson(Map<String, dynamic> json) {
    if (json["notificationSettings"] is String) {
      notificationSettings = json["notificationSettings"];
    }
    if (json["minBidThreshold"] is String) {
      minBidThreshold = json["minBidThreshold"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["notificationSettings"] = notificationSettings;
    _data["minBidThreshold"] = minBidThreshold;
    return _data;
  }
}

class AccountPreference {
  String? locale;
  String? timeZone;
  String? currency;

  AccountPreference({this.locale, this.timeZone, this.currency});

  AccountPreference.fromJson(Map<String, dynamic> json) {
    if (json["locale"] is String) {
      locale = json["locale"];
    }
    if (json["time_zone"] is String) {
      timeZone = json["time_zone"];
    }
    if (json["currency"] is String) {
      currency = json["currency"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["locale"] = locale;
    _data["time_zone"] = timeZone;
    _data["currency"] = currency;
    return _data;
  }
}

class User {
  String? id;
  String? avatar;
  String? fullName;
  String? email;
  String? deviceToken;
  String? type;
  String? socialId;

  User(
      {this.id,
      this.avatar,
      this.fullName,
      this.email,
      this.deviceToken,
      this.type,
      this.socialId});

  User.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["avatar"] is String) {
      avatar = json["avatar"];
    }
    if (json["full_name"] is String) {
      fullName = json["full_name"];
    }
    if (json["email"] is String) {
      email = json["email"];
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
    _data["id"] = id;
    _data["avatar"] = avatar;
    _data["full_name"] = fullName;
    _data["email"] = email;
    _data["device_token"] = deviceToken;
    _data["type"] = type;
    _data["social_id"] = socialId;
    return _data;
  }
}

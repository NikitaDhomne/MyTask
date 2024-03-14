import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task_software_lab/model/verifyotp_request_model.dart';
import 'package:task_software_lab/model/verifyotp_response_model.dart';

Future<VerifyOtpResponse> verifyOtpApi(
    VerifyOtpRequest verifyOtpRequest) async {
  VerifyOtpResponse verifyOtpResponse = VerifyOtpResponse();

  final url = "https://sowlab.pw/assignment/user/verify-otp";
  var response = await http.post(
    Uri.parse(url),
    headers: {
      "Content-Type": "application/json",
    },
    body: json.encode(verifyOtpRequest.toJson()),
  );
  print(response.statusCode);
  print('-----------');
  print(response.body);

  if (response.statusCode == 200) {
    verifyOtpResponse = VerifyOtpResponse.fromJson(json.decode(response.body));
  }
  return verifyOtpResponse;
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task_software_lab/model/resetpassword_request_model.dart';
import 'package:task_software_lab/model/resetpassword_response_model.dart';

Future<ResetPasswordResponse> resetPasswordApi(
    ResetPasswordRequest resetPasswordRequest) async {
  ResetPasswordResponse resetPasswordResponse = ResetPasswordResponse();

  final url = "https://sowlab.pw/assignment/user/reset-password";
  var response = await http.post(
    Uri.parse(url),
    headers: {
      "Content-Type": "application/json",
    },
    body: json.encode(resetPasswordRequest.toJson()),
  );
  print(response.statusCode);
  print('-----------');
  print(response.body);

  if (response.statusCode == 200) {
    resetPasswordResponse =
        ResetPasswordResponse.fromJson(json.decode(response.body));
  }
  return resetPasswordResponse;
}

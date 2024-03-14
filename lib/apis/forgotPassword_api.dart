import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task_software_lab/model/forgotpassword_request_model.dart';
import 'package:task_software_lab/model/forgotpassword_response_model.dart';

Future<ForgotPasswordResponse> forgotPasswordApi(
    ForgotPasswordRequest forgotPasswordRequest) async {
  ForgotPasswordResponse forgotPasswordResponse = ForgotPasswordResponse();

  final url = "https://sowlab.pw/assignment/user/forgot-password";
  var response = await http.post(
    Uri.parse(url),
    headers: {
      "Content-Type": "application/json",
    },
    body: json.encode(forgotPasswordRequest.toJson()),
  );
  print(response.statusCode);
  print('-----------');
  print(response.body);

  if (response.statusCode == 200) {
    forgotPasswordResponse =
        ForgotPasswordResponse.fromJson(json.decode(response.body));
  }
  return forgotPasswordResponse;
}

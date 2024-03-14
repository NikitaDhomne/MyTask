import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task_software_lab/model/login_request_model.dart';
import 'package:task_software_lab/model/login_response_model.dart';

Future<LoginResponse> loginApi(LoginRequest loginRequest) async {
  LoginResponse loginResponse = LoginResponse();

  final url = "https://sowlab.pw/assignment/user/login";
  var response = await http.post(
    Uri.parse(url),
    headers: {
      "Content-Type": "application/json",
    },
    body: json.encode(loginRequest.toJson()),
  );
  print(response.statusCode);
  print('-----------');
  print(response.body);

  if (response.statusCode == 200) {
    loginResponse = LoginResponse.fromJson(json.decode(response.body));
  }
  return loginResponse;
}

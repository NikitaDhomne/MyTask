import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task_software_lab/model/register_request_model.dart';
import 'package:task_software_lab/model/register_response_model.dart';

Future<RegisterResponse> registerApi(RegisterRequest registerRequest) async {
  RegisterResponse registerResponse = RegisterResponse();

  final url = "https://sowlab.pw/assignment/user/register";
  var response = await http.post(
    Uri.parse(url),
    headers: {
      "Content-Type": "application/json",
    },
    body: json.encode(registerRequest.toJson()),
  );
  print(response.statusCode);
  print('-----------');
  print(response.body);
  print(response.statusCode);

  if (response.statusCode == 200) {
    registerResponse = RegisterResponse.fromJson(json.decode(response.body));
  }
  return registerResponse;
}

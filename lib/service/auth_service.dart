import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vehicle_rental_frontendui/model/signup_body_model.dart';
import 'package:vehicle_rental_frontendui/utils/constants/app_constant.dart';

class AuthService {
  login({String? username, String? password}) async {
    var headers = {"Content-type": "application/json", "Accept": "*/*"};
    var body = {"username": username, "password": password};
    var response = await http.post(
        Uri.parse(AppConstant.BASE_URL+AppConstant.LOGIN_URL),
        headers: headers,
        body: jsonEncode(body));
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  }
  register({SignUpBody? body}) async {
    var headers = {"Content-type": "application/json", "Accept": "*/*"};
    var response = await http.post(
        Uri.parse(AppConstant.BASE_URL + AppConstant.REGISTRATION_URL),
        headers: headers,
        body: jsonEncode(body));


    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
         // return jsonDecode(response.body);
      return "successful";
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
  }
}
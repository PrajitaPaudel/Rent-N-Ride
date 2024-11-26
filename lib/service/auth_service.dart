import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vehicle_rental_frontendui/model/signup_body_model.dart';
import 'package:vehicle_rental_frontendui/utils/constants/app_constant.dart';

import '../storage/app_storage.dart';

class AuthService {
  Future login({String? username, String? password}) async {
    var headers = {"Content-type": "application/json", "Accept": "*/*"};
    var body = {"username": username, "password": password};

    var response = await http.post(
      Uri.parse(AppConstant.BASE_URL + AppConstant.LOGIN_URL),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to login with status code: ${response.statusCode}");
    }
  }

  // Helper method to get headers with token

  // Map<String, String> _getAuthHeaders() {
  //   String? token = AppStorage.getToken();
  //   return {
  //     "Content-type": "application/json",
  //     "Accept": "*/*",
  //     if (token != null) "Authorization": "Bearer $token",
  //   };}
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


  Future<bool> updateUserDetails(String userId, UserUpdateModel userDetails) async {
    String? token =AppStorage.getToken();
    final url = Uri.parse(AppConstant.BASE_URL+'api/Users/UpdateUserDetails/$userId');

    try {
      final response = await http.put(
        url,
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(userDetails.toJson()),
      );

      if (response.statusCode == 200) {
        print('Success: ${response.body}');
        return true;
      } else {
        print('Error: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Exception: $e');
      return false;
    }
  }
}
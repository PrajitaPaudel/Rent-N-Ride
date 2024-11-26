import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vehicle_rental_frontendui/utils/constants/app_constant.dart';

import '../../model/admin/user_model.dart';
import '../../storage/app_storage.dart';

class UserService {


  Future<UserListModel?> getAllUsers() async {
    try {
      String? token = AppStorage.getToken();
      final response = await http.get(Uri.parse(AppConstant.BASE_URL+AppConstant.User_List_Admin),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token'
        }
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return UserListModel.fromJson(data);
      } else {
        print('Failed to fetch users: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }
}

import 'package:http/http.dart' as http;
import 'package:vehicle_rental_frontendui/utils/constants/app_constant.dart';
import 'dart:convert';

import '../../model/admin/rental_history_model.dart';
import '../../storage/app_storage.dart';

class RentalHistoryService {




  Future<RentalHistoryModel?> fetchRentalHistory() async {
    String? token = AppStorage.getToken();
    final url = Uri.parse(AppConstant.BASE_URL + AppConstant.Rental_History);

    try {
      final response = await http.get(url,
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },

      );

      if (response.statusCode == 200) {
        print(response.body);
        print(response.statusCode);

        // Parse the JSON response
        var data = jsonDecode(response.body);
        return RentalHistoryModel.fromJson(data);
      } else {
        print('Server Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }
  Future<RentalHistoryModel?> fetchUserRentalHistory() async {
    String? token = AppStorage.getToken();
    final url = Uri.parse(AppConstant.BASE_URL + AppConstant.Rental_History_User);

    try {
      final response = await http.get(url,
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },

      );

      if (response.statusCode == 200) {
        print(response.body);

        // Parse the JSON response
        var data = jsonDecode(response.body);
        return RentalHistoryModel.fromJson(data);
      } else {
        print('Server Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }

}
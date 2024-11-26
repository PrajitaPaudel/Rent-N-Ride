import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vehicle_rental_frontendui/utils/constants/app_constant.dart';

import '../../model/admin/admin_total_model.dart';
import '../../storage/app_storage.dart';


class AdminEarningsService {




  Future<AdminEarningsModel?> getAdminEarnings() async {
    String? token=AppStorage.getToken();
    try {
      final response = await http.get(Uri.parse(AppConstant.BASE_URL+AppConstant.Admin_Total),
      headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token'
          }
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return AdminEarningsModel.fromJson(jsonData);
      } else {
        throw Exception('Failed to load admin earnings');
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }


  Future<DealerEarningsModel?> getDealerEarnings() async {
    String? token=AppStorage.getToken();
    try {
      final response = await http.get(Uri.parse(AppConstant.BASE_URL+AppConstant.Dealer_Total),
          headers: {
            'Content-Type': 'application/json',
            if (token != null) 'Authorization': 'Bearer $token'
          }

      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return DealerEarningsModel.fromJson(jsonData);
      } else {
        throw Exception('Failed to load admin earnings');
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}

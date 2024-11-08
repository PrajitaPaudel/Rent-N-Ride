import 'dart:convert';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:http/http.dart' as http;
import 'package:vehicle_rental_frontendui/model/user/popular_model.dart';

import '../../utils/constants/app_constant.dart';


class ALLVehicleService extends GetxService {
  Future<PopularModel?> fetchPopularVehicles() async {
    try {
      // Fetch the popular vehicles from the API
      var response = await http.get(Uri.parse(AppConstant.BASE_URL + AppConstant.Get_All_Vehicle));
      if (response.statusCode == 200) {
        print(response.body);
        // Parse the JSON response
        return PopularModel.fromJson(jsonDecode(response.body));
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

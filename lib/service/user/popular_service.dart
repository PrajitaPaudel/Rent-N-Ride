import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:vehicle_rental_frontendui/utils/constants/app_constant.dart';

import '../../model/user/popular_model.dart';

class PopularService extends GetxService {
  Future<PopularModel?> fetchPopularVehicles() async {
    try {
      // Fetch the popular vehicles from the API
      var response = await http.get(Uri.parse(AppConstant.BASE_URL + AppConstant.Popular_Vehicle));
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

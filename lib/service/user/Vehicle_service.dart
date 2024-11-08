import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vehicle_rental_frontendui/utils/constants/app_constant.dart';

import '../../model/user/popular_model.dart';
import '../../model/user/vehile_category_model.dart';





class VehicleService {
  Future<List<Vehicle>> getVehiclesByCategory(int categoryId) async {
    final response = await http.get(Uri.parse(AppConstant.BASE_URL + AppConstant.Vehicle_Category + '$categoryId'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      PopularModel categoryModel = PopularModel.fromJson(jsonData);
      return categoryModel.values ?? [];
    } else {
      throw Exception('Failed to load vehicles');
    }
  }
}

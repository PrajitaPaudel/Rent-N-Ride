import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vehicle_rental_frontendui/utils/constants/app_constant.dart';

import '../../model/user/popular_model.dart';
import '../../model/user/vehile_category_model.dart';
import '../../storage/app_storage.dart';





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

  Future<AllVehicleModel> fetchAllVehicles() async {
    String? token = AppStorage.getToken();
    final response = await http.get(Uri.parse(AppConstant.BASE_URL+'api/Vehicle/GetAllVehiclesWithCount'),headers: {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    },);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return AllVehicleModel.fromJson(data);
    } else {
      throw Exception('Failed to load vehicles');
    }
  }
}

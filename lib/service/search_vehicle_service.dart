import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vehicle_rental_frontendui/utils/constants/app_constant.dart';

import '../storage/app_storage.dart';

class VehicleSearchService {



  Future<List<dynamic>> searchVehicles(String query) async {
    String? token=AppStorage.getToken();
    final response = await http.get(Uri.parse(AppConstant.BASE_URL+AppConstant.Search_Vehicle+'$query'),
    headers: {
    'Content-Type': 'application/json',
    if (token != null) 'Authorization': 'Bearer $token'

    }

    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['\$values'] ?? [];
    } else {
      throw Exception('Failed to search vehicles');
    }
  }
}

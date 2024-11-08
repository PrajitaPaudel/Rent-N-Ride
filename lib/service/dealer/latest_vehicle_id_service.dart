import 'dart:io';
import 'package:http/http.dart' as http;
import '../../utils/constants/app_constant.dart';

class LatestVehicleService {


  static Future<int> getLatestVehicleId() async {
    final response = await http.get(Uri.parse(AppConstant.BASE_URL+AppConstant.Latest_VehicleId));
    if (response.statusCode == 200) {
      return int.parse(response.body);
    } else {
      throw Exception("Failed to load vehicle ID");
    }
  }
}

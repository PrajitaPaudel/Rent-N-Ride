import 'dart:io';
import 'package:http/http.dart' as http;
import '../../storage/app_storage.dart';
import '../../utils/constants/app_constant.dart';

class LatestVehicleService {


  static Future<int> getLatestVehicleId() async {
    String? token = AppStorage.getToken();
    final response = await http.get(Uri.parse(AppConstant.BASE_URL+AppConstant.Latest_VehicleId),headers: token != null ? {'Authorization': 'Bearer $token'} : {},);
    if (response.statusCode == 200) {
      return int.parse(response.body);
    } else {
      throw Exception("Failed to load vehicle ID");
    }
  }
}

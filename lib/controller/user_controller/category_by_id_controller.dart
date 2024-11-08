

import 'package:get/get.dart';

import '../../model/user/popular_model.dart';

import '../../service/user/Vehicle_service.dart';
import '../../service/user/popular_service.dart';





class CategoryByIdController extends GetxController {
  final VehicleService vehicleService = VehicleService();
  var vehicles = <Vehicle>[].obs;

  var isLoading = false.obs;


  void fetchVehiclesByCategory(int categoryId) async {
    isLoading.value = true;
    try {
      vehicles.value = await vehicleService.getVehiclesByCategory(categoryId);
    } catch (e) {
      print("Error fetching vehicles: $e");
    } finally {
      isLoading.value = false;
    }
  }



}

import 'package:get/get.dart';
import 'package:vehicle_rental_frontendui/service/search_vehicle_service.dart';

import '../model/user/popular_model.dart';




class VehicleSearchController extends GetxController {
  final VehicleSearchService service=Get.put(VehicleSearchService());
  var vehicles = <Vehicle>[].obs;
  var isLoading = false.obs;



  void searchVehicles(String query) async {
    isLoading.value = true;
    try {
      final data = await service.searchVehicles(query);
      vehicles.value = data.map((v) => Vehicle.fromJson(v)).toList();
    } catch (e) {
      print('Error fetching search results: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

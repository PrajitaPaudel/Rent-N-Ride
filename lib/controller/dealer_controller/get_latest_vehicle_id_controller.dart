

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:vehicle_rental_frontendui/service/dealer/latest_vehicle_id_service.dart';

class LatestVehicleController extends GetxController {
  var latestVehicleId = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLatestVehicleId();
  }

  void fetchLatestVehicleId() async {
    try {
      final response = await LatestVehicleService.getLatestVehicleId();
      latestVehicleId.value = response; 
    } catch (e) {
      print("Failed to fetch latest vehicle ID: $e");
    }
  }

  void incrementVehicleId() {
    latestVehicleId.value++;
  }
}

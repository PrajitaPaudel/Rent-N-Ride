import 'package:get/get.dart';

import '../../model/user/popular_model.dart';
import '../../service/dealer/vehicle_service.dart';

class DealerVehicleController extends GetxController {
  final DealerVehicleService service= Get.put(DealerVehicleService());
  var vehicles = <Vehicle>[].obs;
  Rx<Vehicle?> vehicle = Rx<Vehicle?>(null);
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    fetchVehicles();
  }


  void fetchVehicles() async {
    isLoading.value = true;
    try {
      final data = await service.getDealerVehicles();
      vehicles.value = data ;
    } catch (e) {
      print('Error fetching vehicles: $e');
    } finally {
      isLoading.value = false;
    }
  }



  Future<void> fetchVehicleById(int vehicleId) async {
    isLoading.value = true;
    try {
      final fetchedVehicle = await service.getVehiclesById(vehicleId);
      vehicle.value = fetchedVehicle;
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch vehicle: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

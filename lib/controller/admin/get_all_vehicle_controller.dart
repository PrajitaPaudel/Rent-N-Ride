import 'package:get/get.dart';
import '../../model/user/popular_model.dart';
import '../../service/user/Vehicle_service.dart';


class AdminVehicleController extends GetxController {
  final VehicleService vehicleService=Get.put(VehicleService());
  var vehicles = <Vehicle>[].obs;
  var totalCount = 0.obs;
  var isLoading = true.obs;



  @override
  void onInit() {
    super.onInit();
    fetchVehicles();
  }

  void fetchVehicles() async {
    try {
      isLoading.value = true;
      AllVehicleModel result = await vehicleService.fetchAllVehicles();
      vehicles.value = result.vehicles;
      totalCount.value = result.totalCount;

    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

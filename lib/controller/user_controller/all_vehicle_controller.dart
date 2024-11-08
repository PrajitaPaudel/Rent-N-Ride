


import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:vehicle_rental_frontendui/service/user/allvehicle_service.dart';

import '../../model/user/popular_model.dart';

class AllVehicleController extends GetxController {
  var popularModel = PopularModel().obs; // Reactive model
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchPopularData(); // Fetch data when the controller is initialized
    super.onInit();
  }

  void fetchPopularData() async {
    isLoading(true); // Set loading state to true
    var result = await ALLVehicleService().fetchPopularVehicles();
    if (result != null && result.values != null && result.values!.isNotEmpty) {
      // Assign fetched data to popularModel
      popularModel.value = result;
    } else {
      // Assign an empty list if no data is fetched
      popularModel.value = PopularModel(values: []);
    }
    isLoading(false); // Set loading state to false
  }
}

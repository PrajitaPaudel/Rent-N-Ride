


import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:vehicle_rental_frontendui/service/admin/rental_history_service.dart';
import 'package:vehicle_rental_frontendui/service/user/allvehicle_service.dart';

import '../../model/admin/rental_history_model.dart';
import '../../model/user/popular_model.dart';

class RentalHistoryController extends GetxController {
  var rentalHistoryModel = RentalHistoryModel().obs; // Reactive model
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchRentalData(); // Fetch data when the controller is initialized
    super.onInit();
  }

  void fetchRentalData() async {
    isLoading(true);
    try {
      var result = await RentalHistoryService().fetchRentalHistory();
      if (result != null && result.values != null &&
          result.values!.isNotEmpty) {
        print("Fetched Data: ${result.values}"); // Log parsed data
        rentalHistoryModel.value = result;
      } else {
        print("No data fetched or values are null/empty"); // Log empty case
        rentalHistoryModel.value = RentalHistoryModel(values: []);
      }
    } catch (e) {
      print("Error in fetchRentalData: $e"); // Log any exceptions
    } finally {
      isLoading(false);
    }
  }
}



class RentalUserHistoryController extends GetxController {
  var rentalHistoryModel = RentalHistoryModel().obs; // Reactive model
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchRentalData(); // Fetch data when the controller is initialized
    super.onInit();
  }

  void fetchRentalData() async {
    isLoading(true);
    try {
      var result = await RentalHistoryService().fetchUserRentalHistory();
      if (result != null && result.values != null &&
          result.values!.isNotEmpty) {
        print("Fetched Data: ${result.values}"); // Log parsed data
        rentalHistoryModel.value = result;
      } else {
        print("No data fetched or values are null/empty"); // Log empty case
        rentalHistoryModel.value = RentalHistoryModel(values: []);
      }
    } catch (e) {
      print("Error in fetchRentalData: $e"); // Log any exceptions
    } finally {
      isLoading(false);
    }
  }
}



import 'package:get/get.dart';
import 'package:vehicle_rental_frontendui/model/dealer/booked_vehicle_model.dart';


import '../../model/dealer/dealer_totalearning_model.dart';
import '../../service/dealer/dealer_service.dart';


class DealerOneEarningsController extends GetxController {
  final DealerEarningsService earningsService= Get.put(DealerEarningsService());
  Rx<DealerEarnings?> dealerEarnings = Rx<DealerEarnings?>(null);
  RxBool isLoading = true.obs;


  @override
  void onInit() {
    super.onInit();
    fetchDealerEarnings();
  }

  void fetchDealerEarnings() async {
    isLoading.value = true;
    final earnings = await earningsService.fetchDealerEarnings();
    // if (earnings != null) {
    //   dealerEarnings.value = earnings;
    // }
    dealerEarnings.value = earnings ?? DealerEarnings(totalDealerEarnings: 0.0);
    isLoading.value = false;
  }


}

class DBookingController extends GetxController {
  final DealerEarningsService dealerService=Get.put(DealerEarningsService());
  var bookings = <Booking>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBookings();
  }

  Future<void> fetchBookings() async {
    try {
      isLoading.value = true;
      final data = await dealerService.getBookingsForDealer();
      bookings.value = data;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
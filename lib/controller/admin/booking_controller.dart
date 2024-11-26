// booking_controller.dart
import 'package:get/get.dart';

import '../../model/admin/booking_detailed_model.dart';
import '../../service/admin/booking_service.dart';


class AdminBookingController extends GetxController {
  var isLoading = true.obs;
  var bookingDetails = BookingConfirmationModel().obs;

  final BookingService bookingService = BookingService();

  @override
  void onInit() {
    fetchBookingDetails();
    super.onInit();
  }

  void fetchBookingDetails() async {
    try {
      isLoading(true);
      final details = await bookingService.fetchBookingDetails();
      bookingDetails(details);
    } catch (e) {
      print('Error fetching booking details: $e');
    } finally {
      isLoading(false);
    }
  }
}

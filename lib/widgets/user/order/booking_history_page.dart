import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:vehicle_rental_frontendui/controller/admin/rental_history_controller.dart';
import 'package:vehicle_rental_frontendui/widgets/admin/display/rental_history_detailed_page.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/card/product_card_horizontal.dart';
import 'package:vehicle_rental_frontendui/widgets/user/order/get_all_booking_page.dart';
import 'package:vehicle_rental_frontendui/widgets/user/user_rental_history_detailed_page.dart';

import '../../../controller/user_controller/booking_controller.dart';
import '../../common widget/appbar/header_curveappbar.dart';
import '../../common widget/layout/row_grid_layot.dart';





class UserBookingHistoryPage extends StatefulWidget {

  const UserBookingHistoryPage({super.key,}) ;

  @override
  State<UserBookingHistoryPage> createState() => _UserRentalHistoryPageState();
}

class _UserRentalHistoryPageState extends State<UserBookingHistoryPage> {
  String defaultImageUrl = "assets/logos/logo-white.png";
  final BookingController bookingController = Get.put(BookingController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            THeaderAppBar(text: "Booking History",),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Obx(() {
                if (bookingController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }



                if (bookingController.bookingDetailsList.isEmpty) {
                  return Center(child: Text('No bookings found.'));
                }



                return TVerticalRowLayout(
                  itemCount: bookingController.bookingDetailsList.length,
                  itemBuilder: (context, index) {
                    final bookingDetails = bookingController.bookingDetailsList[index];
                    final vehicle = bookingDetails.bookingInfo?.vehicle;
                    final bookingInfo = bookingDetails.bookingInfo;

                    return TProductCardHorizontal(
                      name: vehicle!.brand,
                      model: vehicle.model,
                      imageUrl: (vehicle.imageUrl.isNotEmpty)
                          ? vehicle.imageUrl?? ''
                          : '',
                      defaultAssetImage: defaultImageUrl,
                      category: vehicle.category,
                      price:vehicle.price.toStringAsFixed(2),
                      onTap: () {
                        final bookingId = bookingDetails.bookingInfo?.id ?? 0;
                        print("Navigating to GetAllBooking with ID: $bookingId");
                        Get.to(() => GetAllBooking(bookingId: bookingId));
                      },
                    );
                  },
                );
              }),
            ),
              ],
        ),
      ),
    );
  }
}

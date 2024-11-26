// booking_list_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vehicle_rental_frontendui/model/user/popular_model.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/card/product_card_horizontal.dart';
import 'package:vehicle_rental_frontendui/widgets/user/product_details/widget/product_card_vertical.dart';

import '../../../controller/admin/booking_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../common widget/appbar/header_curveappbar.dart';
import '../../common widget/layout/row_grid_layot.dart';
import 'Vehicle_detailed_page.dart';
import 'display_booking_detailed_page.dart';



class BookingListPage extends StatelessWidget {
  final AdminBookingController bookingController = Get.put(AdminBookingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          THeaderAppBar(text: " Booked Vehicle",backgroundColor: TColors.blueGery,),

          Obx(() {
            if (bookingController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }

            final bookingDetails = bookingController.bookingDetails.value;

            if (bookingDetails.bookings == null || bookingDetails.bookings!.isEmpty) {
              return Center(child: Text('No bookings found.'));
            }

            return TVerticalRowLayout(
              itemCount: bookingDetails.bookings!.length,
              itemBuilder: (context, index) {
                final booking = bookingDetails.bookings![index];
                final vehicle = booking.bookingInfo!.vehicle!;
                final bookingConfirmationInfo =booking.bookingConfirmationInfo;
                final bookingInfo = booking.bookingInfo;
                return Card(
                  margin: EdgeInsets.all(8),
                  child: TProductCardHorizontal(
                    imageUrl:vehicle.imageUrl!,
                    category: '${vehicle.brand} ',
                    name: '${vehicle.category}\t${vehicle.model}',
                    price:vehicle.price.toString(),
                    model: vehicle.model.toString(),
                    onTap: () {
                      // Navigate to booking details
                    Get.to(()=>BookingHistoryDetailedPage(vehicle: vehicle, bookingConfirmationInfo: bookingConfirmationInfo, bookingInfo: bookingInfo,));
                    },
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}

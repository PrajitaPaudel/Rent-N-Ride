import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:vehicle_rental_frontendui/controller/admin/rental_history_controller.dart';
import 'package:vehicle_rental_frontendui/widgets/admin/display/rental_history_detailed_page.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/card/product_card_horizontal.dart';
import 'package:vehicle_rental_frontendui/widgets/user/order/get_all_booking_page.dart';
import 'package:vehicle_rental_frontendui/widgets/user/user_rental_history_detailed_page.dart';


import '../../../controller/dealer_controller/dealer_controller.dart';
import '../../common widget/appbar/header_curveappbar.dart';
import '../../common widget/layout/row_grid_layot.dart';
import '../display_dealer/dealer_booked_history.dart';





class DealerBookVehiclePage extends StatefulWidget {

  const DealerBookVehiclePage({super.key,}) ;

  @override
  State<DealerBookVehiclePage> createState() => _UserRentalHistoryPageState();
}

class _UserRentalHistoryPageState extends State<DealerBookVehiclePage> {
  String defaultImageUrl = "assets/logos/logo-white.png";
  final DBookingController bookingController = Get.put(DBookingController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [


            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Obx(() {
                if (bookingController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }



                if (bookingController.bookings.isEmpty) {
                  return Center(child: Text('No bookings found.'));
                }



                return TVerticalRowLayout(
                  itemCount: bookingController.bookings.length,
                  itemBuilder: (context, index) {
                    final bookingDetails = bookingController.bookings[index];
                    final vehicle = bookingDetails.vehicle;
                    


                    return TProductCardHorizontal(
                      name: vehicle!.brand??"",
                      model: vehicle.model??"",
                      imageUrl: (vehicle.imageUrl!=null)
                          ? vehicle.imageUrl?? ''
                          : '',
                      defaultAssetImage: defaultImageUrl,
                      category: vehicle.category??"",
                      price:vehicle.price?.toStringAsFixed(2),
                      onTap: () {
                      
                        Get.to(() => DealerBookedHistoryDetailedPage( vehicle: vehicle, booking: bookingDetails,));
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
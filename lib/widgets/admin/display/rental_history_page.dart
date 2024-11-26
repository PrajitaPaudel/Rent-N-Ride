import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:vehicle_rental_frontendui/controller/admin/rental_history_controller.dart';
import 'package:vehicle_rental_frontendui/widgets/admin/display/rental_history_detailed_page.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/card/product_card_horizontal.dart';

import '../../../controller/user_controller/all_vehicle_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../common widget/appbar/header_curveappbar.dart';
import '../../common widget/layout/grid_layout.dart';
import '../../common widget/layout/row_grid_layot.dart';
import '../../user/product_details/product_detail_page.dart';
import '../../user/product_details/widget/product_card_vertical.dart';


class RentalHistoryPage extends StatefulWidget {

  RentalHistoryPage({super.key}) ;

  @override
  State<RentalHistoryPage> createState() => _RentalHistoryPageState();
}

class _RentalHistoryPageState extends State<RentalHistoryPage> {
  String defaultImageUrl = "assets/logos/logo-white.png";

  final RentalHistoryController  rentalHistoryController = Get.put(RentalHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            THeaderAppBar(text: "Rental History",backgroundColor: TColors.blueGery,),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Obx(() {
                if (rentalHistoryController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else if (rentalHistoryController.rentalHistoryModel.value.values == null ||
                    rentalHistoryController.rentalHistoryModel.value.values!.isEmpty) {
                  return Center(child: Text('No Data available'));
                } else {


                  return TVerticalRowLayout(
                    itemCount: rentalHistoryController.rentalHistoryModel.value.values!.length,
                    itemBuilder: (_, index) {
                      var vehicle = rentalHistoryController.rentalHistoryModel.value.values![index];

                      return TProductCardHorizontal(
                        name: vehicle.vehicleBrand ?? 'No Name',
                        model: vehicle.vehicleModel ?? '',
                        imageUrl: vehicle.vehicleImageUrl ??defaultImageUrl,
                        defaultAssetImage: defaultImageUrl,
                        category: vehicle.vehicleCategory ?? 'Unknown Category',
                        price: vehicle.place,

                        onTap: () {
                          Get.to(()=>RentalHistoryDetailedPage(values: vehicle,));
                          // Handle tap event
                        },
                      );
                    },
                  );

                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}

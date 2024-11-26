import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../controller/user_controller/all_vehicle_controller.dart';
import '../../utils/constants/colors.dart';
import '../common widget/appbar/header_curveappbar.dart';
import '../common widget/layout/grid_layout.dart';
import '../common widget/text/big_text.dart';
import '../common widget/text/small_text.dart';
import '../user/product_details/product_detail_page.dart';
import '../user/product_details/widget/product_card_vertical.dart';


class VehicleGallery extends StatelessWidget {

  final AllVehicleController  allVehicleController = Get.put(AllVehicleController ());
  VehicleGallery({Key? key}) : super(key: key) {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            THeaderAppBar(text: "VehicleGallery"),
            Column(
              children: [
                BigText(text:'Available',
                  size: 21,
                  fontWeight: FontWeight.w800,color: TColors.darkGrey,),
                SizedBox(height: 8,),
                SmallText(text: 'Unforgettable journeys start here',
                  textColor: TColors.darkGrey,),
              ],
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Obx(() {
                if (allVehicleController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else if (allVehicleController.popularModel.value.values == null ||
                    allVehicleController.popularModel.value.values!.isEmpty) {
                  return Center(child: Text('No Data available'));
                } else {
                  const String defaultImageUrl = "assets/logos/logo-white.png";

                  return TGridLayout(
                    itemCount: allVehicleController.popularModel.value.values!.length,
                    itemBuilder: (_, index) {
                      var vehicle = allVehicleController.popularModel.value.values![index];

                      return TProductCardVertical(
                        name: vehicle.brand?.vehicleBrandName ?? 'No Name',
                        price: vehicle.price?.toDouble() ?? 0.0,
                        imageUrl: (vehicle.vehicleImages != null && vehicle.vehicleImages!.isNotEmpty)
                            ? vehicle.vehicleImages!.first.imagePath ?? ''
                            : '',
                        defaultAssetImage: defaultImageUrl,
                        category: vehicle.category?.vehicleCategoryName ?? 'Unknown Category',
                        discount: 'PerDay',
                        onTap: () {
                          Get.to(() => ProductDetailScreen(vehicle: vehicle));
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

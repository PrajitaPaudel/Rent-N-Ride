import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:vehicle_rental_frontendui/controller/admin/get_all_vehicle_controller.dart';

import 'package:vehicle_rental_frontendui/widgets/common%20widget/card/product_card_horizontal.dart';
import 'package:vehicle_rental_frontendui/widgets/dealer/vehicle_register/edit_vehicle_registration.dart';


import '../../../controller/dealer_controller/get_vehicle_controller.dart';
import '../../../controller/dealer_controller/vehicle_controller.dart';

import '../../../utils/constants/colors.dart';
import '../../admin/display/Vehicle_detailed_page.dart';
import '../../common widget/appbar/header_curveappbar.dart';

import '../../common widget/card/d_product_card_horizontal.dart';
import '../../common widget/layout/row_grid_layot.dart';



class DealerVehiclePage extends StatelessWidget {

  final DealerVehicleController  vehicleController = Get.put(DealerVehicleController());
  final VehicleController _vehicleController = VehicleController();

  DealerVehiclePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey.shade100,

      body: SingleChildScrollView(
        child: Column(
          children: [


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical:0),
              child: Obx(() {
                if (vehicleController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else if (vehicleController.vehicles.isEmpty) {
                  return Center(child: Text('No Data available'));
                } else {
                  const String defaultImageUrl = "assets/logos/logo-white.png";

                  return TVerticalRowLayout(
                    itemCount: vehicleController.vehicles.length,
                    itemBuilder: (_, index) {
                      var vehicle = vehicleController.vehicles[index];

                      return DTProductCardHorizontal(
                        name: vehicle.category?.vehicleCategoryName ?? 'Unknown Category',
                        model: vehicle.model?.vehicleModelName ?? '',
                        imageUrl: (vehicle.vehicleImages?.isNotEmpty == true
                            ? vehicle.vehicleImages!.first.imagePath
                            : null) ??
                            defaultImageUrl,
                        defaultAssetImage: defaultImageUrl,
                        category: vehicle.brand?.vehicleBrandName?? 'No Name',
                        price: vehicle.price.toString(),
                        edit: (){
                         Get.to(()=>EditVRegistrationFrom(vehicle: vehicle,)) ;
                        },
                        onPress: (){
                          _vehicleController.deleteVehicle( vehicle.vehicleId??0);
                        },
                        onTap: () {
                          Get.to(()=>VehicleDetailedPage(vehicle: vehicle,));
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
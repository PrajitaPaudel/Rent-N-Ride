import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/user_controller/category_by_id_controller.dart';
import '../../utils/constants/colors.dart';
import '../common widget/appbar/header_curveappbar.dart';
import '../common widget/layout/grid_layout.dart';
import '../common widget/text/big_text.dart';
import '../common widget/text/small_text.dart';
import '../user/product_details/category_product_detail_page.dart';
import '../user/product_details/product_detail_page.dart';
import '../user/product_details/widget/product_card_vertical.dart';





class BusPage extends StatelessWidget {
  final CategoryByIdController categoryController = Get.put(CategoryByIdController());

 BusPage({Key? key}) : super(key: key) {
    categoryController.fetchVehiclesByCategory(8); // Fetching cars
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            THeaderAppBar(text: "Bus"),


            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Obx(() {
                if (categoryController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else if (categoryController.vehicles.isEmpty) {
                  return Center(child: Text("No vehicles available"));
                } else {
                  String? defaultImageUrl = "assets/logos/logo-white.png";
                  return TGridLayout(
                    itemCount: categoryController.vehicles.length,
                    itemBuilder: (context, index) {
                      final vehicle = categoryController.vehicles[index];
                      return TProductCardVertical(
                        imageUrl: (vehicle.vehicleImages != null && vehicle.vehicleImages!.isNotEmpty)
                            ? vehicle.vehicleImages!.first.imagePath ?? ''
                            : '',
                        defaultAssetImage:defaultImageUrl ,
                        name: vehicle.model?.vehicleModelName ?? 'Unknown Model',
                        category: vehicle.category?.vehicleCategoryName ?? 'Unknown Category',
                        price: vehicle.price ?? 0.0,
                        onTap: () {
                          Get.to(() => CategoryProductDetailScreen(vehicle: vehicle));
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

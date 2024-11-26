import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/appbar/header_curveappbar.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/circular_container.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/layout/grid_layout.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/layout/row_grid_layot.dart';
import 'package:vehicle_rental_frontendui/widgets/user/product_details/widget/product_card_vertical.dart';

import '../../controller/vehicle_search_controller.dart';
import '../../model/user/popular_model.dart';
import '../../utils/constants/colors.dart';
import '../user/product_details/product_detail_page.dart';


class SearchPage extends StatefulWidget {


  const SearchPage({super.key, });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final  VehicleSearchController controller=Get.put(VehicleSearchController());

  final  searchController = TextEditingController();

  String defaultImageUrl = "assets/logos/logo-white.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            THeaderAppBar(text: 'Search',),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TCircularContainer(
                radius: 100, // Adjust to match the TextField's border radius
                backgroundColor: TColors.lightGrey.withOpacity(0.7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 4,
                    spreadRadius: 2,
                    offset: Offset(2, 2), // Subtle shadow
                  ),
                ],
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(

                     enabledBorder: OutlineInputBorder(

                         borderRadius: BorderRadius.circular(100),
                         borderSide: BorderSide(color: Colors.grey.withOpacity(0.8), width: 0.8)),
                    contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    fillColor: Colors.transparent,
                    filled: true,
                    focusedBorder:OutlineInputBorder(

                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(color: Colors.grey.withOpacity(0.8), width: 0.8)),
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none, // Remove default border
                    prefixIcon: Icon(Icons.search, color: TColors.primary),

                  ),
                  onChanged: (query) {
                    controller.searchVehicles(searchController.text.trim());
                  },
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(12.0),
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }

                if (controller.vehicles.isEmpty) {
                  return Center(child: Text('No vehicles found'));
                }

                return  GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.vehicles.length,
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    mainAxisExtent:288,
                  ),
                  itemBuilder: (context, index) {
                    final vehicle = controller.vehicles[index];
                    return TProductCardVertical(
                        imageUrl:(vehicle.vehicleImages != null && vehicle.vehicleImages!.isNotEmpty)
                            ? vehicle.vehicleImages!.first.imagePath ?? ''
                            : '',
                      defaultAssetImage: defaultImageUrl,
                      name: vehicle.brand?.vehicleBrandName??"",
                      category: vehicle.category?.vehicleCategoryName??"",
                      price:vehicle.price?.toDouble()??0.0,
                      onTap: () {
                        Get.to(() => ProductDetailScreen(vehicle: vehicle));
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

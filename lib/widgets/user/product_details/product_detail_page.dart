import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/curved_widget.dart';
import 'package:vehicle_rental_frontendui/widgets/user/product_details/widget/product_meta_data.dart';
import 'package:vehicle_rental_frontendui/widgets/user/product_details/widget/product_review_page.dart';

import 'package:vehicle_rental_frontendui/widgets/user/product_details/widget/rating_sharing_widget.dart';

import '../../../controller/user_controller/auth_controller.dart';
import '../../../controller/user_controller/popular_controller.dart';
import '../../../model/user/popular_model.dart';
import '../../../storage/app_storage.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../common widget/layout/grid_layout.dart';
import '../../login/login_page.dart';
import '../order/order_page.dart';

class ProductDetailScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController ());
  final Vehicle vehicle; // Accept the vehicle data passed from the previous screen
  final defaultImageUrl = "assets/logos/logo-white.png";

   ProductDetailScreen({Key? key, required this.vehicle}) : super(key: key);






  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TCurvedWidget(
              child: Container(
                color: TColors.light,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 400,
                      child: PageView.builder(
                        itemCount: vehicle.vehicleImages?.length ?? 1,
                        itemBuilder: (context, index) {
                          final imageUrl = vehicle.vehicleImages != null &&
                              vehicle.vehicleImages!.isNotEmpty
                              ? vehicle.vehicleImages![index].imagePath ?? defaultImageUrl
                              : defaultImageUrl;

                          return Padding(
                            padding: EdgeInsets.all(10),
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                // Load default asset image if network image fails
                                return Image.asset(
                                  defaultImageUrl,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    AppBar(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  TRatingAndShare(),
                  SizedBox(height: 10),

                  TProductMetaData(

                    productName: vehicle.model?.vehicleModelName?? 'NO Model',
                    brand: vehicle.brand?.vehicleBrandName ?? 'Unknown Brand',
                    imageUrl: vehicle.vehicleImages?.isNotEmpty == true
                        ? vehicle.vehicleImages![0].imagePath ?? ''
                        : '',
                    defaultAssetImage: defaultImageUrl,
                    originalPrice: (vehicle.price != null)
                        ? (vehicle.price! * 1.1).toStringAsFixed(2)
                        : '0.00',
                    discountedPrice: vehicle.price?.toStringAsFixed(2) ?? '0.00',
                    discountPercentage: '10%',
                    status: vehicle.available == true ? 'Available' : 'Unavailable',
                    category: vehicle.category?.vehicleCategoryName ?? 'Unknown Category',
                    damages: vehicle.damage ?? 'No Damages',
                    description: vehicle.detail ?? 'No description available',
                    reviewCount: 199,
                    onCheckout: () {
                      // Use AuthController to check if user is logged in
                      if (authController.isLoggedIn.value) {
                        Get.to(() => OrderPage(vehicle: vehicle));
                      } else {
                        Get.to(LoginPage()); // Navigate to LoginPage if not logged in
                      }
                    },
                    onViewReviews: () => Get.to(() => ProductReviewPage()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

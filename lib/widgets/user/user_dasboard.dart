import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_frontendui/controller/user_controller/popular_controller.dart';
import 'package:vehicle_rental_frontendui/home_page.dart';
import 'package:vehicle_rental_frontendui/navigation_menu.dart';
import 'package:vehicle_rental_frontendui/utils/constants/colors.dart';
import 'package:vehicle_rental_frontendui/utils/constants/image_strings.dart';
import 'package:vehicle_rental_frontendui/widgets/categories/scooter_page.dart';
import 'package:vehicle_rental_frontendui/widgets/categories/sumo_page.dart';

import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/background_container.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/big_text.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/appbar/custom_app_bar.dart';
import 'package:vehicle_rental_frontendui/widgets/homepage/banner_slider.dart';
import 'package:vehicle_rental_frontendui/widgets/navigation/profile_page.dart';
import 'package:vehicle_rental_frontendui/widgets/user/navigation_drawer.dart';
import 'package:vehicle_rental_frontendui/widgets/user/product_details/product_detail_page.dart';
import 'package:vehicle_rental_frontendui/widgets/user/product_details/widget/product_card_vertical.dart';
import '../categories/bike_page.dart';
import '../categories/bus_page.dart';
import '../categories/car_page.dart';
import '../categories/cycle_page.dart';
import '../categories/jeep_page.dart';
import '../categories/microbus_Page.dart';
import '../categories/minivan-page.dart';
import '../categories/scorpio_page.dart';
import '../categories/tempo_page.dart';
import '../categories/truck_page.dart';
import '../categories/van_page.dart';
import '../common widget/container/circular_container.dart';
import '../common widget/container/curved_widget.dart';
import '../common widget/custom_curved_edge.dart';
import '../common widget/horizontal_categories_icons.dart';
import 'package:vehicle_rental_frontendui/controller/user_controller/categories_controller.dart';

import '../common widget/layout/grid_layout.dart';


class UserDashboardPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  UserDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = Get.put(CategoryController());
    final PopularController popularController = Get.put(PopularController());

    return Scaffold(
      key: _scaffoldKey,
      drawer: NavigationUser(),
      backgroundColor: TColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TCurvedWidget(
              child: Container(
                color: TColors.subPrimary,
                child: TAppBar(
                  backgroundColor: TColors.subPrimary,
                  textColor: TColors.white,
                  subtitleText: 'Welcome! User',
                  customIcon: GestureDetector(
                    onTap: () => _scaffoldKey.currentState?.openDrawer(),
                    child: Container(
                      width: 45,
                      height: 45,
                      child: Icon(Icons.menu, color: Colors.white),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.teal.shade300,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: BannerSlider(),
            ),
            BigText(
              text: "Popular Categories",
              fontWeight: FontWeight.bold,
              padding: const EdgeInsets.only(left: 10),
            ),
            const SizedBox(height: 20),
            Obx(() => SizedBox(
              height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: categoryController.categoryImages.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return TCategoresImage(
                    image: categoryController.categoryImages[index],
                    title: categoryController.categoryTitles[index],
                    onTap: () {
                      final categoryPage = {
                        'Bike': () => Get.to(() => BikePage()),
                        'Scorpio': () => Get.to(() => ScorpioPage()),
                        'Cycle': () => Get.to(() => CyclePage()),
                        'Bus': () => Get.to(() => BusPage()),
                        'Scooter': () => Get.to(() => ScooterPage()),
                        'Car': () => Get.to(() => CarPage()),
                        'Auto': () => Get.to(() => TempoPage()),
                        'jeep': () => Get.to(() => JeepPage()),
                        'Sumo': () => Get.to(() => SumoPage()),
                        'MicroBus': () => Get.to(() => MicroBusPage()),
                        'MiniVan': () => Get.to(() => MinivanPage()),
                        'Truck': () => Get.to(() => TruckPage()),
                        'Van': () => Get.to(() => VanPage()),
                      };
                      final page = categoryPage[categoryController.categoryTitles[index]];
                      if (page != null) page();
                    },
                  );
                },
              ),
            )),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Obx(() {
                if (popularController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else if (popularController.popularModel.value.values == null ||
                    popularController.popularModel.value.values!.isEmpty) {
                  return Center(child: Text('No Data available'));
                } else {
                  const String defaultImageUrl = "assets/logos/logo-white.png";

                  return TGridLayout(
                    itemCount: popularController.popularModel.value.values!.length,
                    itemBuilder: (_, index) {
                      var vehicle = popularController.popularModel.value.values![index];

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



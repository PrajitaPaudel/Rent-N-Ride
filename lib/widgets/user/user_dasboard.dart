import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_frontendui/home_page.dart';
import 'package:vehicle_rental_frontendui/navigation_menu.dart';
import 'package:vehicle_rental_frontendui/utils/constants/colors.dart';
import 'package:vehicle_rental_frontendui/widgets/categories/scooter_page.dart';
import 'package:vehicle_rental_frontendui/widgets/categories/sumo_page.dart';

import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/background_container.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/big_text.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/appbar/custom_app_bar.dart';
import 'package:vehicle_rental_frontendui/widgets/homepage/banner_slider.dart';
import 'package:vehicle_rental_frontendui/widgets/navigation/profile_page.dart';
import 'package:vehicle_rental_frontendui/widgets/user/navigation_drawer.dart';
import 'package:vehicle_rental_frontendui/widgets/user/product_details/widget/product_card_vertical.dart';
import '../categories/bike_page.dart';
import '../categories/bus_page.dart';
import '../categories/car_page.dart';
import '../categories/cycle_pade.dart';
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

    return Scaffold(
      key: _scaffoldKey, // Assign the scaffold key here
      drawer:  NavigationUser(),
      backgroundColor: TColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TAppBar with Drawer Icon
            TCurvedWidget(
              child: Container(
                color: TColors.subPrimary,
                child: TAppBar(
                  backgroundColor: TColors.subPrimary,
                  textColor: TColors.white,
                  subtitleText: 'Welcome! User',

                  customIcon: GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState?.openDrawer(); // Use the scaffold key to open the drawer
                    },
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
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
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
                      final category = categoryController.categoryTitles[index];
                      if (category == 'Bike') {
                        Get.to(() => BikePage());
                      } else if (category == 'Scorpio') {
                        Get.to(() => SumoPage());
                      } else if (category == 'Cycle') {
                        Get.to(() => CyclePage());
                      } else if (category == 'Bus') {
                        Get.to(() => BusPage());
                      } else if (category == 'Scooter') {
                        Get.to(() => ScooterPage());
                      } else if (category == 'Car') {
                        Get.to(() => CarPage());
                      }
                    },
                  );
                },
              ),
            )),
            const SizedBox(height: 10),
            TGridLayout(
              itemCount: 8,
              itemBuilder: (_, index) {
                return TProductCardVertical();
              },
            ),
          ],
        ),
      ),
    );
  }
}


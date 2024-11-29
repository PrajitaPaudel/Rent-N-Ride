import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_frontendui/home_page.dart';
import 'package:vehicle_rental_frontendui/storage/app_storage.dart';
import 'package:vehicle_rental_frontendui/widgets/admin/display/admin_dashboard_page.dart';
import 'package:vehicle_rental_frontendui/widgets/chat_page.dart';
import 'package:vehicle_rental_frontendui/widgets/chat_screen_page.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/verticle_order_containter.dart';
import 'package:vehicle_rental_frontendui/widgets/navigation/about_us_page.dart';
import 'package:vehicle_rental_frontendui/widgets/navigation/profile/admin_profile.dart';
import 'package:vehicle_rental_frontendui/widgets/navigation/vehicle%20Gallary/Admin_vehicle_gallary.dart';
import 'package:vehicle_rental_frontendui/widgets/navigation/vehicle%20Gallary/dealer_vehicle_gallary.dart';
import 'package:vehicle_rental_frontendui/widgets/navigation/vehicle_gallery_page.dart';
import 'package:vehicle_rental_frontendui/widgets/navigation/contact_us_page.dart';
import 'package:vehicle_rental_frontendui/widgets/navigation/profile/profile_page.dart';
import 'package:vehicle_rental_frontendui/widgets/user/return_booking/return_booking_page.dart';

import 'package:vehicle_rental_frontendui/widgets/dealer/dealer_dashboard_page.dart';
import 'package:vehicle_rental_frontendui/widgets/user/user_dasboard.dart';

import 'controller/user_controller/auth_controller.dart'; // Import your AuthController


class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final navController = Get.put(NavigationController());
    final authController = Get.find<AuthController>();

    return Scaffold(
      bottomNavigationBar: Obx(
            () => NavigationBar(
          height: 80,
          elevation: 0,
          indicatorColor: const Color(0xFF7dd5c8),
          selectedIndex: navController.selectedIndex.value,
          onDestinationSelected: (index) => navController.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.category), label: 'Gallery'),
            NavigationDestination(icon: Icon(Icons.phone), label: 'Contact Us'),
            NavigationDestination(icon: Icon(Icons.person_pin_circle_outlined), label: 'About Us'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => navController.screens[navController.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final RxList<Widget> screens = <Widget>[].obs;

  @override
  void onInit() {
    super.onInit();
    _setupScreens();
  }

  void _setupScreens() {
    final authController = Get.find<AuthController>();
    final isLoggedIn = authController.isLoggedIn.value;
    final userType = AppStorage.getUserType(); // Get the userType from AppStorage

    if (isLoggedIn) {
      if (userType == 'User') {
        screens.addAll([
          UserDashboardPage(),
          VehicleGallery(),
          ContactUsPage(),
          AboutUsPage(),
          Profile(),
        ]);
      } else if (userType == 'Dealer') {
        screens.addAll([
          DealerDashboardPage(),
          DealerVehicleGallery(),
          ContactUsPage(),
          AboutUsPage(),
          Profile(),
        ]);
      } else if (userType == 'Admin') {
        screens.addAll([
          AdminDashboardPage(),
          AdminVehicleGallery(),
          ContactUsPage(),
          AboutUsPage(),
          AdminProfile(),
        ]);
      } else {
        // Fallback for unknown user types
        screens.addAll([
          HomePage(),
          VehicleGallery(),
          ContactUsPage(),
          AboutUsPage(),
          Profile(),
        ]);
      }
    } else {
      // Default screens for unauthenticated users
      screens.addAll([
        HomePage(),
        VehicleGallery(),
        ContactUsPage(),
        AboutUsPage(),
        Profile(),
      ]);
    }
  }
}

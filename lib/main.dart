import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'package:vehicle_rental_frontendui/home_page.dart';
import 'package:vehicle_rental_frontendui/navigation_menu.dart';
import 'package:vehicle_rental_frontendui/utils/theme/theme.dart';
import 'package:vehicle_rental_frontendui/widgets/dealer/dealer_dashboard_page.dart';
import 'package:vehicle_rental_frontendui/widgets/user/user_dasboard.dart';

import 'controller/user_controller/auth_controller.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init("User"); // Ensure storage is initialized before use

  // Initialize AuthController
  Get.put(AuthController()); // Use Get.put here to make the AuthController immediately available

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: NavigationMenu(),
    );
  }
}


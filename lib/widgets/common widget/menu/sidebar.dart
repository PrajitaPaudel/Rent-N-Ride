import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vehicle_rental_frontendui/utils/constants/colors.dart';
import 'package:vehicle_rental_frontendui/utils/constants/image_strings.dart';
import 'package:vehicle_rental_frontendui/widgets/admin/display/display_brand.dart';
import 'package:vehicle_rental_frontendui/widgets/admin/display/display_category_page.dart';
import 'package:vehicle_rental_frontendui/widgets/admin/display/admin_dashboard_page.dart';
import 'package:vehicle_rental_frontendui/widgets/admin/display/display_model.dart';
import 'package:vehicle_rental_frontendui/widgets/admin/display/get_all_vehicle_page.dart';
import 'package:vehicle_rental_frontendui/widgets/admin/display/rental_history_page.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/image/t_rounded_images.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/menu/menu_item.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/small_text.dart';
import 'package:vehicle_rental_frontendui/widgets/dealer/dealer_dashboard_page.dart';
import 'package:vehicle_rental_frontendui/widgets/navigation/profile/profile_page.dart';

import '../../../storage/app_storage.dart';
import '../../admin/display/booking_page.dart';
import '../../admin/display/display_user.dart';
import '../../navigation/profile/admin_profile.dart';
import '../../signup/setting_page.dart';


class TSideBar extends StatelessWidget {
  const TSideBar({super.key});


  @override
  Widget build(BuildContext context) {
    String userId=AppStorage.getUserId();
    return Drawer(
      shape: BeveledRectangleBorder(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(right: BorderSide(color: Colors.grey, width: 1)),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TRoundedImages(
                  imageUrl: TImages.lightAppLogo,
                  width: 100,
                  height: 100,
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(height: 32),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SmallText(
                      text: 'MENU',
                      size: 20,
                      textColor: Colors.grey.shade500,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 10),
                    TMenuItem(
                      destinationPage: () => AdminDashboardPage(),
                      icon: Iconsax.status,
                      itemName: 'Dashboard',
                    ),
                    TMenuItem(
                      destinationPage: () => AllVehiclePage(),
                      icon: Iconsax.car5,
                      itemName: 'Vehicle',
                    ),
                    TMenuItem(
                      destinationPage: () => AdminDisplayCategory(),
                      icon: Iconsax.category,
                      itemName: 'Categories',
                    ),
                    TMenuItem(
                      destinationPage: () => AdminDisplayBrand(),
                      icon: Iconsax.dcube,
                      itemName: 'Brand',
                    ),
                    TMenuItem(
                      destinationPage: () => AdminDisplayModel(),
                      icon: Iconsax.autobrightness,
                      itemName: 'Model',
                    ),
                    TMenuItem(
                      destinationPage: () => UserListPage(),
                      icon: Iconsax.people,
                      itemName: 'User',
                    ),
                    TMenuItem(
                      destinationPage: () => AdminDashboardPage(),
                      icon: Iconsax.people5,
                      itemName: 'Dealer',
                    ),
                    TMenuItem(
                      destinationPage: () => BookingListPage(),
                      icon: Iconsax.car,
                      itemName: 'Booked vehicle',
                    ),
                    TMenuItem(
                      destinationPage: () => RentalHistoryPage(),
                      icon: Iconsax.car,
                      itemName: 'Rental History',
                    ),
                    TMenuItem(
                      destinationPage: () =>AdminProfile(),
                      icon: Iconsax.profile_2user,
                      itemName: 'Profile',
                    ),
                    TMenuItem(

                      destinationPage: () => UpdateUserPage(userId: userId,),
                      icon: Iconsax.setting,
                      itemName: 'Setting',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

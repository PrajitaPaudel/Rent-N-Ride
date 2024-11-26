import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vehicle_rental_frontendui/home_page.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/menu/menu_item.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/small_text.dart';
import 'package:vehicle_rental_frontendui/widgets/homepage/search_page.dart';
import 'package:vehicle_rental_frontendui/widgets/navigation/profile/profile_page.dart';
import 'package:vehicle_rental_frontendui/widgets/user/order/booking_history_page.dart';
import 'package:vehicle_rental_frontendui/widgets/user/order/order_page.dart';
import 'package:vehicle_rental_frontendui/widgets/user/return_booking/payment_page.dart';
import 'package:vehicle_rental_frontendui/widgets/user/user_dasboard.dart';
import 'package:vehicle_rental_frontendui/widgets/user/user_rental_history_page.dart';

import '../../controller/user_controller/auth_controller.dart';
import '../../model/dealer/vehicle_registration_model.dart';
import '../../model/login_model.dart';
import '../../storage/app_storage.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../common widget/verticle_order_containter.dart';
import '../dealer/dealer_dashboard_page.dart';
import '../signup/setting_page.dart';
import 'order/get_all_booking_page.dart';


class NavigationUser extends StatefulWidget {

  const NavigationUser({super.key});

  @override
  State<NavigationUser> createState() => _NavigationUserState();
}
class _NavigationUserState extends State<NavigationUser> {
  LoginModel? loginModel;
  late VRegistrationBody vRegistration;
  int bookingId=10;


  @override
  void initState() {
    super.initState();
    // Retrieve user data from AppStorage
    var userData = AppStorage.readUser; // This should be a Map
    if (userData != null) {
      loginModel = LoginModel.fromJson(userData); // Convert it back to LoginModel
    }
  }




  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 200,
            child:  DrawerHeader(
              decoration: BoxDecoration(
                color: TColors.subPrimary,
                shape: BoxShape.rectangle,

              ),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: TColors.white,
                        shape: BoxShape.circle,

                      ),
                      child: Icon(Icons.person,color: Colors.teal,size: 50,)),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallText(text: loginModel?.firstName?? 'Ava ' ),
                      const SizedBox(width: 5,),
                      SmallText(text: loginModel?.lastName?? 'Dhakal' ),
                    ],
                  ),
                  SmallText(text: loginModel?.email??"ava123@gmail.com")
                ],
              ),

            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              if (loginModel?.userType == 'User') {
                Get.to(UserDashboardPage());
              } else if (loginModel?.userType == 'Dealer') {
                Get.to(DealerDashboardPage());
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Search'),
            onTap: () {
              Get.to(()=>SearchPage());
            },

          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Get.to(()=>Profile());
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
       String userId=AppStorage.getUserId();
              Get.to(()=>UpdateUserPage(userId: userId,));
                  //VerticalContainer());
            },


          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: const Text('My Booking'),
            onTap: () {
              Get.to(()=>UserBookingHistoryPage());
                 // Get.to(()=>GetAllBooking(bookingId:bookingId ,));
              // Get.to(()=>PaymentPage(returnId: 13, bookingId: 9 ,));
            },


          ),
          ListTile(
            leading: Icon(Icons.history),
            title: const Text('Rental History'),
            onTap: () {
              // Get.to(()=>GetAllBooking(bookingId:bookingId ,));

               Get.to(()=>UserRentalHistoryPage());
            },


          ),

          ListTile(
            leading: Icon(Icons.logout_outlined),
            title: Text('Logout'),
            onTap: () {
              AuthController().logout();
            },

          ),
        ],
      ),
    );
  }
}



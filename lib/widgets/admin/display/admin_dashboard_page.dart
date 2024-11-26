import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vehicle_rental_frontendui/widgets/admin/widget/admin_dashboard_card_widget.dart';
import 'package:vehicle_rental_frontendui/widgets/admin/widget/category_card_widget.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/circular_container.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/curved_widget.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/menu/sidebar.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/big_text.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/small_text.dart';
import 'package:vehicle_rental_frontendui/widgets/dealer/widget/d_categories.dart';
import 'package:vehicle_rental_frontendui/widgets/dealer/widget/d_tabbar.dart';
import '../../../controller/admin/admin_earning_controller.dart';
import '../../../controller/admin/booking_controller.dart';
import '../../../controller/admin/get_all_vehicle_controller.dart';
import '../../../controller/admin/user_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../common widget/appbar/custom_app_bar.dart';
import '../../homepage/search_page.dart';
import '../../user/navigation_drawer.dart';




class AdminDashboardPage extends StatefulWidget {


  AdminDashboardPage({super.key});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    TabController tabController=TabController(length: 4, vsync: this);
    final AdminVehicleController  vehicleController = Get.put(AdminVehicleController());
    final UserController userController = Get.put(UserController());
    final AdminBookingController bookingController = Get.put(AdminBookingController());
    final AdminEarningsController   adminEarningsController=Get.put(AdminEarningsController());
    final DealerEarningsController dealerEarningsController=Get.put(DealerEarningsController());
    return Scaffold(
      key:_scaffoldKey, // Assign the scaffold key here
      drawer:  TSideBar(),
      backgroundColor: TColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start ,
          children: [
            TCurvedWidget(
              child:Container(
                color: Colors.blueGrey.shade700,
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  height: 150,
                  child: TAppBar(
                    backgroundColor:  Colors.blueGrey.shade700,
                    textColor: TColors.white,
                    subtextColor: Colors.white,
                    subtitleText: 'Welcome Admin !',
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
                          color: Colors.blueGrey.shade900,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
            BigText(text: 'Dashboard',size: 27,textAlign: TextAlign.start,padding:EdgeInsets.only(left: 20,top: 10,right: 10,bottom: 10),
             fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
            Obx(() =>     TAdminDashboardCard(
                    title: 'Admin Earning',
                    subtitle: adminEarningsController.adminEarnings.value.totalAdminEarnings.toStringAsFixed(2),
                    icon: Iconsax.arrow_up_3,
                    color: Colors.blueGrey.shade50,
                    stats: 25,),),
                  SizedBox(height: 10,),
                  Obx(() =>     TAdminDashboardCard(
                    title: 'Dealer Earning',
                    subtitle: dealerEarningsController.dealerEarnings.value.totalDealerEarnings.toStringAsFixed(2),
                    icon: Iconsax.arrow_up_3,
                    color: Colors.blueGrey.shade50,
                    stats: 25,),),
                  SizedBox(height: 10,),
                  Obx(()=>  TAdminDashboardCard(
                    title: 'Book Vehicles',
                    subtitle:bookingController.bookingDetails.value.totalCount.toString()??'0',
                    icon: Iconsax.arrow_up_3,
                    color: Colors.blueGrey.shade50,
                    stats: 25,),),
                  SizedBox(height: 10,),

                Obx(()=>  TAdminDashboardCard(
                    title: 'Total User',
                    subtitle:userController.userList.value?.totalUsers.toString()??"",
                    icon: Iconsax.arrow_up_3,
                    color: Colors.blueGrey.shade50,
                    stats: 25,),),
                  SizedBox(height: 10,),

    Obx(() =>
      TAdminDashboardCard(
        title: 'Total Vehicles',
        subtitle: vehicleController.totalCount.toString(),
        icon: Iconsax.arrow_up_3,
        color: Colors.blueGrey.shade50,
        stats: 25,)
      ,
    ),


                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}


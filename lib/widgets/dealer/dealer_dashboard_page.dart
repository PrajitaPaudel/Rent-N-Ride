import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/curved_widget.dart';
import 'package:vehicle_rental_frontendui/widgets/dealer/widget/d_categories.dart';
import 'package:vehicle_rental_frontendui/widgets/dealer/widget/d_tabbar.dart';
import '../../utils/constants/colors.dart';
import '../common widget/appbar/custom_app_bar.dart';
import '../homepage/search_page.dart';
import '../user/navigation_drawer.dart';
import 'dealer_navigation_drawer.dart';
import 'display_dealer/display_dealer_vehicle_page.dart';
import 'order/cancel_order.dart';
import 'order/deliver_order.dart';
import 'order/new_order.dart';
import 'order/pending_order.dart';

class DealerDashboardPage extends StatefulWidget {

 DealerDashboardPage({super.key});

  @override
  State<DealerDashboardPage> createState() => _DealerDashboardPageState();
}

class _DealerDashboardPageState extends State<DealerDashboardPage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    TabController tabController=TabController(length: 4, vsync: this);
    return Scaffold(
      key:_scaffoldKey, // Assign the scaffold key here
      drawer:  DNavigationUser(),
      backgroundColor: TColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TCurvedWidget(
              child:Container(
                color: TColors.subPrimary,
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  height: 150,
                  child: TAppBar(
                    backgroundColor: TColors.subPrimary,
                    textColor: TColors.white,
                    subtextColor: Colors.white,
                    subtitleText: 'Welcome! Dealer',
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
            ),
            DCategories(),
           DTabBar(
               tabController: tabController),
             SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
               height: 800,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.transparent,
              ),
              child: TabBarView(
                controller: tabController,
                children: [
                   NewOrder(),
                  DealerVehiclePage(),
                  DealerBookVehiclePage(),
                  DealerBookVehiclePage(),


                ],

              ),
            )
          ],
        ),
      ),
    );
  }
}














































// TAppBar(
// backgroundColor: TColors.subPrimary,
// textColor: TColors.white,
// subtextColor: Colors.white,
// subtitleText: 'Welcome! Dealer',
// customIcon: GestureDetector(
// onTap: () {
// Get.to(() => SearchPage());
// },
// child: Container(
// width: 45,
// height: 45,
// child: Icon(Icons.search, color: Colors.white),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(15),
// color: Colors.teal.shade300,
// ),
// ),
// ),
// ),
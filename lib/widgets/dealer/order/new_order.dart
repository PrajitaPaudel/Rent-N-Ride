import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../controller/admin/admin_earning_controller.dart';
import '../../../controller/dealer_controller/dealer_controller.dart';
import '../../admin/widget/admin_dashboard_card_widget.dart';


class NewOrder extends StatelessWidget {
  final DealerOneEarningsController dealerEarningsController=Get.put(DealerOneEarningsController());
   NewOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Obx(() =>     Padding(
              padding: const EdgeInsets.all(10.0),
              child: TAdminDashboardCard(
                title: 'Dealer Earning',
                subtitle: dealerEarningsController.dealerEarnings.value!.totalDealerEarnings.toString(),
                icon: Iconsax.arrow_up_3,
                color: Colors.blueGrey.shade50,
                stats: 25,),
            ),),
          ],
        ),
      ),
    );
  }
}


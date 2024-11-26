import 'package:get/get.dart';

import '../../model/admin/admin_total_model.dart';
import '../../service/admin/admin_total_service.dart';


class AdminEarningsController extends GetxController {
  final AdminEarningsService earningsService=Get.put(AdminEarningsService());
  var adminEarnings = AdminEarningsModel(totalAdminEarnings: 0.0).obs;
  var isLoading = true.obs;



  @override
  void onInit() {
    super.onInit();
    fetchAdminEarnings();
  }

  void fetchAdminEarnings() async {
    isLoading.value = true;
    final earnings = await earningsService.getAdminEarnings();
    if (earnings != null) {
      adminEarnings.value = earnings;
    }
    isLoading.value = false;
  }
}


class DealerEarningsController extends GetxController {
  final AdminEarningsService earningsService=Get.put(AdminEarningsService());

  var dealerEarnings = DealerEarningsModel( totalDealerEarnings:0.0).obs;
  var isLoading = true.obs;



  @override
  void onInit() {
    super.onInit();
    fetchDealerEarnings();
  }

  void fetchDealerEarnings() async {
    isLoading.value = true;
    final earnings = await earningsService.getDealerEarnings();
    if (earnings != null) {
      dealerEarnings.value = earnings;
    }
    isLoading.value = false;
  }
}


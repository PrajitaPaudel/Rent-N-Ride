import 'package:flutter/material.dart';


import 'package:get/get.dart';

import '../../model/user/popular_model.dart';
import '../../service/user/popular_service.dart';


class PopularController extends GetxController {
  var popularModel = PopularModel().obs; 
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchPopularData(); 
    super.onInit();
  }

  void fetchPopularData() async {
    isLoading(true); 
    var result = await PopularService().fetchPopularVehicles();
    if (result != null && result.values != null && result.values!.isNotEmpty) {
      // Assign fetched data to popularModel
      popularModel.value = result;
    } else {
      // Assign an empty list if no data is fetched
      popularModel.value = PopularModel(values: []);
    }
    isLoading(false);
  }
}


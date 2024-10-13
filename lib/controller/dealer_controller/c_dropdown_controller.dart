import 'package:get/get.dart';

import '../../model/dealer/category_model.dart';



class VCategoryController extends GetxController {
  var selectedCategoryId = 1.obs;  // Default to the first category id
  List<VehicleCategoryModel> categories = [
    VehicleCategoryModel(id: 1, name: "Bike"),
    VehicleCategoryModel(id: 2, name: "Car"),
    VehicleCategoryModel(id: 3, name: "Cycle"),
    VehicleCategoryModel(id: 4, name: "Bus"),
    VehicleCategoryModel(id: 5, name: "Scorpio"),
    VehicleCategoryModel(id: 6, name: "Scooter"),
    // Add more categories
  ];

  void setSelectedCategoryId(int id) {
    selectedCategoryId.value = id;
  }
}


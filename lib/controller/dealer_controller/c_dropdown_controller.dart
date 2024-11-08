import 'package:get/get.dart';

import '../../model/dealer/category_model.dart';



class VCategoryController extends GetxController {
  var selectedCategoryId = 1.obs;  // Default to the first category id
  List<VehicleCategoryModel> categories = [
    VehicleCategoryModel(id: 1, name: "Car"),
    VehicleCategoryModel(id: 2, name: "Bus"),
    VehicleCategoryModel(id: 3, name: "Sumo"),
    VehicleCategoryModel(id: 4, name: "Truck"),
    VehicleCategoryModel(id: 5, name: "MiniVan"),
    VehicleCategoryModel(id: 6, name: "Jeep"),
    VehicleCategoryModel(id: 7, name: "MicroBus"),
    VehicleCategoryModel(id: 8, name: "Auto"),
    VehicleCategoryModel(id: 9, name: "Van"),
    VehicleCategoryModel(id: 10, name: "Scooter"),
    VehicleCategoryModel(id: 11, name: "Cycle"),
    VehicleCategoryModel(id: 12, name: "Bike"),
    VehicleCategoryModel(id: 13, name: "Scorpio"),


    // Add more categories
  ];

  void setSelectedCategoryId(int id) {
    selectedCategoryId.value = id;
  }
}


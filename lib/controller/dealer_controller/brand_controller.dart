

import 'package:get/get.dart';
import 'package:vehicle_rental_frontendui/model/dealer/brand_model.dart';

import '../../model/dealer/category_model.dart';



class BrandController extends GetxController {
  var selectedBrandId = 1.obs;  // Default to the first category id
  List<VehicleBrandModel> brand = [
    VehicleBrandModel(id: 1, name: "Hyundai"),
    VehicleBrandModel(id: 2, name: "Suzuki"),
    VehicleBrandModel(id: 3, name: "Toyota"),
    VehicleBrandModel(id: 4, name: "Honda"),
    VehicleBrandModel(id: 5, name: "Tata"),
    VehicleBrandModel(id: 6, name: "Ashok Leyland"),
    VehicleBrandModel(id: 7, name: "Mahindra"),
    VehicleBrandModel(id: 8, name: "Eicher"),
    VehicleBrandModel(id: 9, name: "Other"),
    // Add more categories
  ];

  void setSelectedBrandId(int id) {
    selectedBrandId.value = id;
  }
}
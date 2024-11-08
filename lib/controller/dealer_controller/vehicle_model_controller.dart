


import 'package:get/get.dart';
import 'package:vehicle_rental_frontendui/model/dealer/brand_model.dart';

import '../../model/dealer/category_model.dart';
import '../../model/dealer/vechicle_model.dart';



class VModelController extends GetxController {
  var selectedModel = 1.obs;  // Default to the first category id
  List<VehicleModel> model = [
    VehicleModel(id: 1, name: "i10"),
    VehicleModel(id: 2, name: "i20"),
    VehicleModel(id: 3, name: "Creta"),
    VehicleModel(id: 4, name: "Santro"),
    VehicleModel(id: 5, name: "Alto"),
    VehicleModel(id: 6, name: "Swift"),
    VehicleModel(id: 7, name: "WagonR"),
    VehicleModel(id: 8, name: "Celerio"),
    VehicleModel(id: 9, name: "Corolla"),
    VehicleModel(id: 10, name: "Yaris"),
    VehicleModel(id: 11, name: "Vitz"),
    VehicleModel(id: 12, name: "City"),
    VehicleModel(id: 13, name: "Amaze"),
    VehicleModel(id: 14, name: "Jazz"),
    VehicleModel(id: 15, name: "Tiago"),
    VehicleModel(id: 16, name: "Nexon"),
    VehicleModel(id: 17, name: "Tigor"),
    VehicleModel(id: 18, name: "LP 407"),
    VehicleModel(id: 19, name: "LP 1512"),
    VehicleModel(id: 20, name: "Viking"),
    VehicleModel(id: 21, name: "Cheetah"),
    VehicleModel(id: 22, name: "Cruzio"),
    VehicleModel(id: 23, name: "Supro Bus"),
    VehicleModel(id: 24, name: "Skyline"),
    VehicleModel(id: 25, name: "Starline"),
    VehicleModel(id: 26, name: "Sumo Gold"),
    VehicleModel(id: 27, name: "Sumo Victa"),
    VehicleModel(id: 28, name: "Bolero"),
    VehicleModel(id: 29, name: "Scorpio"),
    VehicleModel(id: 30, name: "Blazo"),
    VehicleModel(id: 31, name: "Furio"),
    VehicleModel(id: 32, name: "Pro 3015"),
    VehicleModel(id: 33, name: "Pro 2049"),
    VehicleModel(id: 34, name: "Dost+"),
    VehicleModel(id: 35, name: "2516 IL"),
    VehicleModel(id: 36, name: "Eeco"),
    VehicleModel(id: 37, name: "Omni"),
    VehicleModel(id: 38, name: "Venture"),
    VehicleModel(id: 39, name: "Winger"),
    VehicleModel(id: 40, name: "Supro Van"),
    VehicleModel(id: 41, name: "Bolero Camper"),
    VehicleModel(id: 42, name: "other"),

    // Add more categories
  ];

  void setSelectedModelId(int id) {
    selectedModel.value = id;
  }
}
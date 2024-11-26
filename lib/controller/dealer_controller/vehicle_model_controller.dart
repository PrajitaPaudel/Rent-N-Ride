


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_frontendui/widgets/admin/display/display_model.dart';



import '../../model/dealer/vechicle_model.dart';



import '../../service/dealer/categories_service.dart';
import '../../storage/app_storage.dart';
import '../../utils/constants/colors.dart';
import '../../widgets/admin/display/admin_dashboard_page.dart';
import '../../widgets/admin/display/display_brand.dart';
import '../../widgets/common widget/show_custom_snakebar.dart';
import '../../widgets/dealer/dealer_dashboard_page.dart';

class VehicleModelController extends GetxController {
  final VehicleModelService modelService = VehicleModelService();

  var models = <VehicleModel>[].obs;
  var isLoading = true.obs;
  var selectedModelId = Rxn<int>();
  var currentBrand = Rxn<VehicleModel>();
  final userType = AppStorage.getUserType();

  @override
  void onInit() {
    super.onInit();
    loadModels(); // Load models when the controller initializes
  }

  void loadModels() async {
    try {
      isLoading(true);
      models.value = await modelService.fetchModels();
    } finally {
      isLoading(false);
    }
  }

  void selectModel(int id) {
    selectedModelId.value = id;
    print('Selected model ID: $id'); // For debugging
  }


  Future<void> loadModelDetails(int id) async {
    isLoading(true);
    try {
      currentBrand.value = await modelService.fetchModelById(id);
    } catch (e) {
      print("Error loading Model details: $e");
    } finally {
      isLoading(false);
    }
  }


  Future<void> addVehicleModel(String modelName) async {
    VehicleModel newModel = VehicleModel(
      vehicleModelName: modelName,);
    try {
      await modelService.addVehicleModel(newModel);
      showCustomSnakeBar('Category add Successfully', title: 'Success',
          color: TColors.success);
      if (userType == 'Admin') {
        Get.to(() => AdminDashboardPage());
      }else {
        Get.to(() => DealerDashboardPage());
      }
    } catch (e) {
      throw e;
    }
  }


  Future<void> updateVehicleModel(int? modelId, String vehicleModelName) async {
    VehicleModel updatedBrand = VehicleModel(
        modelId: modelId,
        vehicleModelName: vehicleModelName);

    try {
      await modelService.updateVehicleModel(modelId, updatedBrand);
      if (userType == 'Admin') {
        Get.to(() => AdminDashboardPage());
      }else {
        Get.to(() => DealerDashboardPage());
      }
    } catch (e) {
      throw e;
    }
  }


  final DeleteBrandService _deleteModelService = DeleteBrandService();

  Future<void> deleteModel(int? modelId) async {
    bool confirmDelete = await _showConfirmationDialog();
    if (!confirmDelete) return;

    try {
      await _deleteModelService.deleteModel(modelId!);
      showCustomSnakeBar("Vehicle Model deleted successfully.", color: Colors.green,title: 'Success');
      if (userType == 'Admin') {
        Get.to(() => AdminDashboardPage());
      }else {
        Get.to(() => DealerDashboardPage());
      }
    } catch (error) {
      print("Failed to delete vehicle Model: $error");
      showCustomSnakeBar("Failed to delete vehicle Model.", color: Colors.red);
    }
  }



  Future<bool> _showConfirmationDialog() async {
    return await Get.dialog<bool>(
      AlertDialog(
        title: Text("Confirm Deletion"),
        content: Text("Are you sure you want to delete this Brand?"),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: Text("Delete"),
          ),
        ],
      ),
    ) ??
        false;
  }
}


// class VModelController extends GetxController {
//   var selectedModel = 1.obs;  // Default to the first category id
//   List<VehicleModel> model = [
//     VehicleModel(id: 1, name: "i10"),
//     VehicleModel(id: 2, name: "i20"),
//     VehicleModel(id: 3, name: "Creta"),
//     VehicleModel(id: 4, name: "Santro"),
//     VehicleModel(id: 5, name: "Alto"),
//     VehicleModel(id: 6, name: "Swift"),
//     VehicleModel(id: 7, name: "WagonR"),
//     VehicleModel(id: 8, name: "Celerio"),
//     VehicleModel(id: 9, name: "Corolla"),
//     VehicleModel(id: 10, name: "Yaris"),
//     VehicleModel(id: 11, name: "Vitz"),
//     VehicleModel(id: 12, name: "City"),
//     VehicleModel(id: 13, name: "Amaze"),
//     VehicleModel(id: 14, name: "Jazz"),
//     VehicleModel(id: 15, name: "Tiago"),
//     VehicleModel(id: 16, name: "Nexon"),
//     VehicleModel(id: 17, name: "Tigor"),
//     VehicleModel(id: 18, name: "LP 407"),
//     VehicleModel(id: 19, name: "LP 1512"),
//     VehicleModel(id: 20, name: "Viking"),
//     VehicleModel(id: 21, name: "Cheetah"),
//     VehicleModel(id: 22, name: "Cruzio"),
//     VehicleModel(id: 23, name: "Supro Bus"),
//     VehicleModel(id: 24, name: "Skyline"),
//     VehicleModel(id: 25, name: "Starline"),
//     VehicleModel(id: 26, name: "Sumo Gold"),
//     VehicleModel(id: 27, name: "Sumo Victa"),
//     VehicleModel(id: 28, name: "Bolero"),
//     VehicleModel(id: 29, name: "Scorpio"),
//     VehicleModel(id: 30, name: "Blazo"),
//     VehicleModel(id: 31, name: "Furio"),
//     VehicleModel(id: 32, name: "Pro 3015"),
//     VehicleModel(id: 33, name: "Pro 2049"),
//     VehicleModel(id: 34, name: "Dost+"),
//     VehicleModel(id: 35, name: "2516 IL"),
//     VehicleModel(id: 36, name: "Eeco"),
//     VehicleModel(id: 37, name: "Omni"),
//     VehicleModel(id: 38, name: "Venture"),
//     VehicleModel(id: 39, name: "Winger"),
//     VehicleModel(id: 40, name: "Supro Van"),
//     VehicleModel(id: 41, name: "Bolero Camper"),
//     VehicleModel(id: 42, name: "other"),
//
//     // Add more categories
//   ];
//
//   void setSelectedModelId(int id) {
//     selectedModel.value = id;
//   }
// }
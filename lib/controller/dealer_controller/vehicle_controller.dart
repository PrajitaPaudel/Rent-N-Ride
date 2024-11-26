



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:vehicle_rental_frontendui/controller/dealer_controller/get_latest_vehicle_id_controller.dart';
import 'package:vehicle_rental_frontendui/service/dealer/categories_service.dart';
import 'package:vehicle_rental_frontendui/widgets/admin/display/admin_dashboard_page.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/show_custom_snakebar.dart';
import 'package:vehicle_rental_frontendui/widgets/dealer/vehicle_register/vehicle_register_page.dart';

import '../../model/dealer/vehicle_registration_model.dart';
import '../../service/dealer/vehicle_service.dart';
import '../../storage/app_storage.dart';
import '../../widgets/dealer/dealer_dashboard_page.dart';

class VehicleController extends GetxController {
  final LatestVehicleController controller = Get.put(LatestVehicleController());

  // Form field controllers
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  // Variables to store state for each field
  RxInt categoryId = 1.obs;
  RxInt modelId = 1.obs;
  RxInt brandId = 1.obs;
  RxString damage = ''.obs;
  RxBool available = false.obs;
  RxBool popular = false.obs;
  RxList<XFile> images = <XFile>[].obs;

  // Store the user ID
  String? userId;

  @override
  void onInit() {
    super.onInit();
    // Retrieve userId from AppStorage when controller is initialized
    userId = AppStorage.getUserId();

  }

  Future<void> vregistration({
    required int categoryId,
    required int modelId,
    required int brandId,
    required String price,
    required String damage,
    required bool available,
    required bool popular,
    required List<XFile> images,
    required String description,
  }) async {
    // Retrieve UserId from AppStorage
    String? userId =AppStorage.getUserId();
    // AppStorage.getUserId();
    print("User ID in vregistration: $userId"); // Log to confirm retrieval

    if (userId == null || userId.isEmpty) {
      print("User ID not found. Please log in.");
      return;
    }
    // Convert XFiles to Files
    List<File> imageFiles = images.map((xfile) => File(xfile.path)).toList();

    // Create the registration body
    VRegistrationBody registrationBody = VRegistrationBody(
      vehicleId: controller.latestVehicleId.value,
      categoryId: categoryId,
      modelId: modelId,
      brandId: brandId,
      price: price,
      damage: damage,
      available: available,
      popular: popular,
      description: description,
      files: imageFiles,
      userId: userId,  // Use userId from onInit
    );

    try {
      // Call the service to upload registration data and images
      var response = await uploadVehicleRegistration(
        registrationBody: registrationBody,
        imageFiles: imageFiles,
         userId: userId!,  // Pass userId to the service
      );

      // Use the response here
      if (response == "successful") {
        showCustomSnakeBar("Vehicle registration Successful", title: "Success", color: Colors.green);
        
        Get.to(() => VehicleRegisterPage());
      } else {
        print('userid:$userId');
        showCustomSnakeBar("Vehicle registration failed", title: "Error", color: Colors.red);
      }
    } catch (e) {
      print('userid:$userId');
      showCustomSnakeBar("Vehicle registration failed", title: "Error", color: Colors.red);
      print('Error: $e');
    }
  }

  // // Clear form data function
  // void _clearFormData() {
  //
  //
  //   priceController.clear();
  //   descriptionController.clear();
  //   categoryId.value = 1;
  //   modelId.value = 1;
  //   brandId.value = 1;
  //   damage.value = '';
  //   available.value = false;
  //   popular.value = false;
  //   images.clear();
  //
  // }
  //
  //
  // // Helper function to clear all form data
  //
  //
  // @override
  // void onClose() {
  // priceController.dispose();
  // descriptionController.dispose();
  // super.onClose();
  // }





  Future<void> updateVehicleDetails(VRegistrationBody updatedVehicle, List<File> images) async {
    try {
      await updateVehicle(updatedVehicle, images);
      Get.snackbar("Success", "Vehicle updated successfully!");
      Get.to(()=>DealerDashboardPage());
    } catch (e) {
      Get.snackbar("Error", "Failed to update vehicle");
    }
  }



  final DeleteVehicleService _deleteVehicleService = DeleteVehicleService();
  String? userType=AppStorage.getUserType();
  Future<void> deleteVehicle(int vehicleId) async {
    bool confirmDelete = await _showConfirmationDialog();
    if (!confirmDelete) return;

    try {
      await _deleteVehicleService.deleteVehicle(vehicleId);
      showCustomSnakeBar("Vehicle deleted successfully.", color: Colors.green,title: 'Success');
    if(userType=='Dealer'){
      Get.to(() => DealerDashboardPage());
    }else{
      Get.to(() => AdminDashboardPage());
    }
    } catch (error) {
      print("Failed to delete vehicle: $error");
      showCustomSnakeBar("Failed to delete vehicle.", color: Colors.red);
    }
  }



  Future<bool> _showConfirmationDialog() async {
    return await Get.dialog<bool>(
      AlertDialog(
        title: Text("Confirm Deletion"),
        content: Text("Are you sure you want to Delete this vehicle?"),
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


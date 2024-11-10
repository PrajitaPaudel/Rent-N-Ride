



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:vehicle_rental_frontendui/controller/dealer_controller/get_latest_vehicle_id_controller.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/show_custom_snakebar.dart';
import 'package:vehicle_rental_frontendui/widgets/dealer/vehicle_register/vehicle_register_page.dart';

import '../../model/dealer/vehicle_registration_model.dart';
import '../../service/dealer/vehicle_service.dart';
import '../../widgets/dealer/dealer_dashboard_page.dart';

class VehicleController extends GetxController {
  final LatestVehicleController controller = Get.put(LatestVehicleController());


  // Assuming you have TextEditingControllers for form fields like price and description
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
  );

  try {
  // Call the service to upload registration data and images
  var response = await uploadVehicleRegistration(
  registrationBody: registrationBody,
  imageFiles: imageFiles,
  );

  // Display success message
  showCustomSnakeBar(
  "Vehicle registration Successful",
  title: "Success",
  color: Colors.green,
  );

  // Clear form data and reset fields
  _clearFormData();

  // Handle response (success or error)
  print('Success: $response');
  // Navigate to a different page if needed, e.g., DealerDashboardPage
  Get.to(() => VehicleRegisterPage());

  } catch (e) {
  print('Error: $e');
  showCustomSnakeBar("Vehicle registration failed", title: "Error", color: Colors.red);
  }
  }

  // Helper function to clear all form data
  void _clearFormData() {
  categoryId.value = 1;
  modelId.value = 1;
  brandId.value = 1;
  priceController.clear();
  descriptionController.clear();
  damage.value = '';
  available.value = false;
  popular.value = false;
  images.clear();
  }

  @override
  void onClose() {
  priceController.dispose();
  descriptionController.dispose();
  super.onClose();
  }





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

  Future<void> deleteVehicle(int vehicleId) async {
    bool confirmDelete = await _showConfirmationDialog();
    if (!confirmDelete) return;

    try {
      await _deleteVehicleService.deleteVehicle(vehicleId);
      showCustomSnakeBar("Vehicle deleted successfully.", color: Colors.green,title: 'Success');
      Get.to(() => DealerDashboardPage());
    } catch (error) {
      print("Failed to delete vehicle: $error");
      showCustomSnakeBar("Failed to delete vehicle.", color: Colors.red);
    }
  }

  Future<bool> _showConfirmationDialog() async {
    return await Get.dialog<bool>(
      AlertDialog(
        title: Text("Confirm Deletion"),
        content: Text("Are you sure you want to delete this vehicle?"),
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


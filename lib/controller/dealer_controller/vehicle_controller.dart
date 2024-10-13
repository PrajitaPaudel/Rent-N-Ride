

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/show_custom_snakebar.dart';

import '../../model/dealer/vehicle_registration_model.dart';
import '../../service/vehicle_service.dart';
import '../../widgets/dealer/dealer_dashboard_page.dart';

class VehicleController extends GetxController {
  Future<void> vregistration({
    required int categoryId,
    required int modelId,
    required int brandId,
    required String price,
    required String damage,
    required String available,
    required String popular,
    required List<XFile> images,
    required String description,
  }) async {
    // Convert XFiles to Files
    List<File> imageFiles = images.map((xfile) => File(xfile.path)).toList();

    // Create the registration body
    VRegistrationBody registrationBody = VRegistrationBody(
      categoryId: categoryId,
      modelId: modelId,
      brandId: brandId,
      price: price,
      damage: damage,
      available: available,
      popular: popular,
      description:description,
      files: imageFiles,
    );

    // Call the service to upload registration data and images
    try {
      var response = await uploadVehicleRegistration(
        registrationBody: registrationBody,
        imageFiles: imageFiles,
      );
       showCustomSnakeBar("Vehicle registration SuccessFull",title: "Success",
           color:Colors.green,);
      // Handle response (success or error)
      print('Success: $response');
      Get.to(()=>DealerDashboardPage());
    } catch (e) {
      print('Error: $e');
    }
  }
}

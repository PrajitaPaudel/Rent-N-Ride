import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vehicle_rental_frontendui/utils/constants/app_constant.dart';
import 'dart:convert';

import '../../model/dealer/vehicle_registration_model.dart';
import '../../widgets/common widget/show_custom_snakebar.dart';

Future uploadVehicleRegistration({
  required VRegistrationBody registrationBody,
  required List<File> imageFiles,
}) async {
  try {
    var request = http.MultipartRequest(
        'POST', Uri.parse(AppConstant.BASE_URL + AppConstant.Add_Vehicle));

    // Add form fields
    request.fields['CategoryId'] = registrationBody.categoryId.toString();
    request.fields['BrandId'] = registrationBody.brandId.toString();
    request.fields['ModelId'] = registrationBody.modelId.toString();
    request.fields['Price'] = registrationBody.price;
    request.fields['Damage'] = registrationBody.damage;
    request.fields['Available'] = registrationBody.available.toString();
    request.fields['Popular'] = registrationBody.popular.toString();
    request.fields['Detail'] = registrationBody.description;

    // Add image files (note: 'imageFile' should match the backend expectation)

    for (var file in imageFiles) {
      request.files.add(await http.MultipartFile.fromPath(
        'imageFiles', file.path,
      ));
    }

    var response = await request.send();
    String responseBody = await response.stream.bytesToString();
    // var data = jsonDecode(responseBody);
    print(responseBody);
    // print(data);


    if (response.statusCode == 200) {

      return "successful";
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
  //   if (response.statusCode == 200) {
  //     return data;
  //   } else {
  //     throw Exception("Failed to upload registration and images.");
  //   }
   } catch (e) {
    throw Exception("Error: ${e.toString()}");
  }
}




Future<dynamic> updateVehicle(VRegistrationBody vehicle, List<File> imageFiles) async {
  try {
    var request = http.MultipartRequest(
      'PUT',
      Uri.parse('${AppConstant.BASE_URL}${AppConstant.Update_vehicle}${vehicle.vehicleId}'),
    );

    // Set request fields with explicit string conversions
    request.fields['CategoryId'] = vehicle.categoryId.toString();
    request.fields['BrandId'] = vehicle.brandId.toString();
    request.fields['ModelId'] = vehicle.modelId.toString();
    request.fields['Price'] = vehicle.price.toString();
    request.fields['Damage'] = vehicle.damage;
    request.fields['Available'] = vehicle.available.toString();
    request.fields['Popular'] = vehicle.popular.toString();
    request.fields['Detail'] = vehicle.description;

    // Print fields to debug
    print("Request fields: ${request.fields}");

    // Add image files
    for (var file in imageFiles) {
      request.files.add(await http.MultipartFile.fromPath(
        'imageFiles', file.path,
      ));
    }
    // Send request and handle response
    var response = await request.send();
    if (response.statusCode == 200) {
      showCustomSnakeBar("Update Successful", color: Colors.green);
      return "Vehicle update successful";
    } else {
      print("Update Fail: ${response.statusCode}");

      // Read and print response for debugging
      final responseBody = await response.stream.bytesToString();
      print("Response body: $responseBody");
      showCustomSnakeBar("Update Fail: ${response.statusCode}", color: Colors.red);
      return null;
    }
  } catch (e) {
    print("Error: $e");
    throw Exception("Error: ${e.toString()}");
  }
}



class DeleteVehicleService {
  Future<void> deleteVehicle(int vehicleId) async {
    final String url = '${AppConstant.BASE_URL}${AppConstant.Delete_Vehicle}$vehicleId';

    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print("Vehicle deleted successfully");
      } else {
        print("Failed to delete vehicle: ${response.body}");
        throw Exception("Failed to delete vehicle");
      }
    } catch (error) {
      print("Error: $error");
      throw error;
    }
  }
}

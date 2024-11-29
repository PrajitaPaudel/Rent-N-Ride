import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:vehicle_rental_frontendui/utils/constants/app_constant.dart';
import 'dart:convert';

import '../model/dealer/vehicle_registration_model.dart';

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
    request.fields['Available'] = registrationBody.available;
    request.fields['Popular'] = registrationBody.popular;
    request.fields['Remarks'] = registrationBody.description;

    // Add image files (note: 'imageFile' should match the backend expectation)
    for (var file in imageFiles) {
      var fileItem = await http.MultipartFile.fromPath('imageFile', file.path);  // Use 'imageFile' here
      request.files.add(fileItem);
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

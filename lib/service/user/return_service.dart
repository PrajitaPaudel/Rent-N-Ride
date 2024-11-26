


// return_service.dart
import 'dart:convert';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:vehicle_rental_frontendui/utils/constants/app_constant.dart';

import '../../model/user/return_booking_model.dart';
import '../../model/user/returncofirmation_model.dart';
import '../../storage/app_storage.dart';





class ReturnService {
  Future<int?> submitReturn(ReturnModel returnModel) async {
    String? token = AppStorage.getToken();
    const String url = AppConstant.BASE_URL + AppConstant.Return_Booking;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(returnModel.toJson()),
      );
      print('Request body: ${jsonEncode(returnModel.toJson())}');
      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        int returnId = responseBody["returnId"];
        print(returnId);
        return returnId;
      } else {
        print("Failed to add return: ${response.statusCode}");
        print("Response body: ${response.body}");
        throw Exception(
            "Failed to add return, response code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: ${e.toString()}");
      throw Exception("Error submitting return: ${e.toString()}");
    }
  }

    Future<ReturnConfirmationModel?> fetchReturnConfirmation(int returnId) async {
    String? token = AppStorage.getToken();
    final String url = '${AppConstant.BASE_URL}${AppConstant.Damage_Url}$returnId';
    try {
      final response = await http.get(Uri.parse(url),headers: token != null ? {'Authorization': 'Bearer $token'} : {});
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        return ReturnConfirmationModel.fromJson(jsonResponse);
      } else {
        print("Failed to fetch return confirmation: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      throw Exception("Error: ${e.toString()}");
    }
  }
}



class DeleteBookingService {
  Future<void> deleteBooking(int bookingId) async {
    String? token = AppStorage.getToken();
    final String url = '${AppConstant.BASE_URL}${AppConstant.Delete_Booking}$bookingId';

    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: token != null ? {'Authorization': 'Bearer $token'} : {},
      );

      if (response.statusCode == 200) {
        print("Booking deleted successfully");
      } else {
        print("Failed to delete booking: ${response.body}");
      }
    } catch (error) {
      print("Error: $error");
    }
  }
}




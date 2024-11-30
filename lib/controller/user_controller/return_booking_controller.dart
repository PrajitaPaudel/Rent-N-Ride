


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/show_custom_snakebar.dart';
import 'package:vehicle_rental_frontendui/widgets/user/user_dasboard.dart';

import '../../model/user/booking_payment_list_model.dart';
import '../../model/user/return_booking_model.dart';
import '../../model/user/returncofirmation_model.dart';
import '../../service/user/return_service.dart';
import '../../storage/app_storage.dart';
import '../../utils/constants/app_constant.dart';
import '../../widgets/user/return_booking/payment_page.dart';
import 'package:http/http.dart' as http;




class ReturnController extends GetxController {
  final ReturnService _returnService = ReturnService();

 
  int? bookingId;
  DateTime returnDate = DateTime.now();
  String returnLocation = '';
  int rating = 1;
  String? damageReported;

 
  Future<void> submitReturn({
    required int bookingId,
    required DateTime returnDate,
    required String returnLocation,
    required int rating,
    String? damageReported,
  }) async {
    String? userId =AppStorage.getUserId();
   
    if (returnLocation.isEmpty || rating < 1 || rating > 5) {
      print("Please fill in all required fields correctly.");
      return;
    }

    // Create the return model
    ReturnModel returnModel = ReturnModel(
      bookingId: bookingId,
      actualReturnDate: returnDate,
      returnLocation: returnLocation,
      rating: rating,
      damageReported: damageReported,
      userId: userId,
    );

    
    try {
   
      int? returnId = await _returnService.submitReturn(returnModel);

      if (returnId != null) {
        showCustomSnakeBar("Return submitted successfully.", color: Colors.green, title: 'Success');
        print("Return submitted successfully with returnId: $returnId");

    
        if (damageReported == "No Damage") {
          Get.to(() => UserDashboardPage());
        } else {
         
          Get.to(() => PaymentPage(returnId: returnId, bookingId: bookingId,));
        }
      } else {
        print("Failed to submit return: returnId is null.");
        showCustomSnakeBar("Failed to submit return",);
      }
    } catch (error) {
      print("Failed to submit return: $error");
      showCustomSnakeBar("Failed to submit return");
    }
  }


  Future<void> confirmReturn(int returnId, BookingConfirmationModel bookingConfirmation) async {
    String? token = AppStorage.getToken();
    
    final url = '${AppConstant.BASE_URL}${AppConstant.Damage_Payment}$returnId';

    try {
      // Sending the data to the backend
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(bookingConfirmation.toJson()), 
      );

      if (response.statusCode == 200) {
   
        Get.to(() => UserDashboardPage());
        print("Return confirmed successfully!");
        showCustomSnakeBar('Return confirmed successfully!', title: 'Success', color: Colors.green);
      } else {
       
        print("Failed to confirm return: ${response.statusCode}");
        showCustomSnakeBar("Failed to confirm return", title: 'Error', color: Colors.red);
      }
    } catch (e) {
      
      print("Error in confirming return: $e");
      showCustomSnakeBar("Error in confirming return", title: 'Error', color: Colors.red);
    }
  }



  final DeleteBookingService _deleteBookingService = DeleteBookingService();

  Future<void> deleteBooking(int bookingId) async {
    bool confirmDelete = await _showConfirmationDialog();
    if (!confirmDelete) return;

    try {
      await _deleteBookingService.deleteBooking(bookingId);
      showCustomSnakeBar("Booking deleted successfully.", color: Colors.green,
          title: 'Success');
      Get.to(() => UserDashboardPage());
    } catch (error) {
      print("Failed to delete booking: $error");
      showCustomSnakeBar("Failed to delete booking.", color: Colors.red);
    }
  }

  Future<bool> _showConfirmationDialog() async {
    return await Get.dialog<bool>(
      AlertDialog(
        title: Text("Confirm Deletion"),
        content: Text("Are you sure you want to Cancel this booking?"),
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



  final ReturnService _returnConfirmService = ReturnService();
  var returnTotal = ReturnConfirmationModel(
  totalAmountBeforeFees: 0.0,
  totalLateFees: 0.0,
  damageFee: 0.0,
  paymentMethods: [],
  ).obs;

  Future<void> fetchReturnTotal(int returnId) async {
  try {
  print("Fetching booking total for ID: $returnId");
  final total = await _returnConfirmService.fetchReturnConfirmation(returnId);
  if (total != null) {
  returnTotal.value = total;
  } else {
  print("No return total found for ID: $returnId");
  Get.snackbar('Info', 'No return details found');
  }
  } catch (e) {
  print('${e.toString()}');
  Get.snackbar('Error', 'Failed to load return details');
  }
  }
  }


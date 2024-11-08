import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vehicle_rental_frontendui/widgets/common%20widget/show_custom_snakebar.dart';

import '../../model/user/booking _confirmation_model.dart';
import '../../model/user/booking_model.dart';
import '../../model/user/booking_payment_list_model.dart';
import '../../utils/constants/app_constant.dart';


class BookingService {
  // Function to upload booking details along with images
  Future<int?> uploadBookingDetails(BookingModel bookingModel) async {
    try {
      // Create the multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(AppConstant.BASE_URL + AppConstant.Booking_URL),

      );

      // Add basic booking fields
      request.fields['StartDate'] = bookingModel.startDate.toIso8601String();
      request.fields['EndDate'] = bookingModel.endDate?.toIso8601String() ?? '';
      request.fields['Place'] = bookingModel.place;
      request.fields['VehicleId'] = bookingModel.vehicleId?.toString() ?? '';
      request.fields['PhoneNumber'] = bookingModel.phoneNumber;
      request.fields['Email'] = bookingModel.email!;
      request.fields['Address'] = bookingModel.address ?? '';
      request.fields['BillingAddress'] = bookingModel.billingAddress ?? '';
      request.fields['InsuranceRequired'] = bookingModel.insuranceRequired.toString();
      request.fields['SpecialRequests'] = bookingModel.specialRequests ?? '';

      // Add image files if they exist
      if (bookingModel.files != null) {
        for (var file in bookingModel.files!) {
          request.files.add(await http.MultipartFile.fromPath(
            'licenseImage', // This should match the backend's expected field name
            file.path,
            filename: '${DateTime.now().millisecondsSinceEpoch}_${file.path.split('/').last}',
          ));
        }
      }

      // Send the request and capture the response
      var streamedResponse = await request.send();

      // Convert the streamed response to a normal response
      var response = await http.Response.fromStream(streamedResponse);

      print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      // Handle the response
      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        int bookingId = responseBody["bookingId"];
        return bookingId; // Return the bookingId for further use
      } else {
        print("Booking upload failed with status: ${response.statusCode}");
        return null;
      }}catch (e) {
      throw Exception("Error: ${e.toString()}");
    }
  }


  Future<BookingTotalModel> getTotalAmount(int bookingId) async {
    final url = Uri.parse(AppConstant.BASE_URL+AppConstant.Booking_Total+'$bookingId');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      print("Booking upload success with status: ${response.statusCode}");
      return BookingTotalModel.fromJson(json.decode(response.body));
    } else {
      print("Booking upload failed with status: ${response.statusCode}");
      throw Exception('Failed to load booking total amount');
    }
  }


  Future<Map<String, dynamic>?> fetchBookingDetails(int bookingId) async {
    final url = AppConstant.BASE_URL+AppConstant.Get_All_Booking+'$bookingId';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        // Check if the nested data exists and is not null
        final bookingConfirmation = responseData['bookingConfirmationInfo'] != null
            ? BookingConfirmationInfo.fromJson(responseData['bookingConfirmationInfo'])
            : null;

        final bookingInfo = responseData['bookingInfo'] != null
            ? BookingInfo.fromJson(responseData['bookingInfo'])
            : null;

        return {
          'bookingConfirmation': bookingConfirmation,
          'bookingInfo': bookingInfo,
        };
      } else {
        throw Exception("Failed to load booking details");
      }
    } catch (e) {
      print("Error fetching booking details: $e");
      return null;
    }
  }


// Method to update booking details
  // Future<dynamic> updateBooking(int bookingId,BookingModel bookingModel) async {
  //   try {
  //     var uri = Uri.parse(AppConstant.BASE_URL+AppConstant.Update_Booking+'$bookingId');
  //     var request = http.MultipartRequest('PUT', uri);
  //
  //     // Add booking details as fields
  //     request.fields['StartDate'] = bookingModel.startDate.toIso8601String();
  //     request.fields['EndDate'] = bookingModel.endDate?.toIso8601String() ?? '';
  //     request.fields['Place'] = bookingModel.place;
  //     request.fields['PhoneNumber'] = bookingModel.phoneNumber;
  //     request.fields['Email'] = bookingModel.email ?? '';
  //     request.fields['Address'] = bookingModel.address ?? '';
  //     request.fields['BillingAddress'] = bookingModel.billingAddress ?? '';
  //     request.fields['InsuranceRequired'] = bookingModel.insuranceRequired.toString();
  //     request.fields['SpecialRequests'] = bookingModel.specialRequests ?? '';
  //
  //     // Attach updated images if there are any
  //     if (bookingModel.files != null) {
  //       for (var file in bookingModel.files!) {
  //         request.files.add(await http.MultipartFile.fromPath(
  //           'licenseImage', // This should match the backend's expected field name
  //           file.path,
  //           filename: '${DateTime.now().millisecondsSinceEpoch}_${file.path.split('/').last}',
  //         ));
  //       }
  //     }
  //
  //     var response = await request.send();
  //     if (response.statusCode == 200) {
  //       showCustomSnakeBar("Update SuccessFul",color: Colors.green);
  //       return "Booking upload successful";
  //     } else {
  //       print("Update Fail: ${response.statusCode}");
  //       showCustomSnakeBar("Update Fail",);
  //       return null;
  //     }
  //   } catch (e) {
  //     throw Exception("Error: ${e.toString()}");
  //   }
  // }
}




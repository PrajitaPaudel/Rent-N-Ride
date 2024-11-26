// booking_service.dart
import 'package:http/http.dart' as http;
import 'package:vehicle_rental_frontendui/storage/app_storage.dart';
import 'package:vehicle_rental_frontendui/utils/constants/app_constant.dart';
import 'dart:convert';

import '../../model/admin/booking_detailed_model.dart';




class BookingService {
  

  Future<BookingConfirmationModel> fetchBookingDetails() async {
    String? token=AppStorage.getToken();
    final url = Uri.parse(AppConstant.BASE_URL+AppConstant.Booking_List_Admin);

    try {
      final response = await http.get(url,
     headers: {
       'Content-Type': 'application/json',
       if (token != null) 'Authorization': 'Bearer $token'
     }
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return BookingConfirmationModel.fromJson(data);
      } else {
        throw Exception('Failed to load booking details');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

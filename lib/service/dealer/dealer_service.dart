import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vehicle_rental_frontendui/model/dealer/booked_vehicle_model.dart';
import 'package:vehicle_rental_frontendui/storage/app_storage.dart';
import 'package:vehicle_rental_frontendui/utils/constants/app_constant.dart';


import '../../model/dealer/dealer_totalearning_model.dart';


class DealerEarningsService {




  Future<DealerEarnings?> fetchDealerEarnings() async {
    String? token =AppStorage.getToken();
    try {
      final response = await http.get(Uri.parse(AppConstant.BASE_URL+AppConstant.One_Dealer_Earning),
      headers:  token != null ? {'Authorization': 'Bearer $token'} : {},

      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return DealerEarnings.fromJson(jsonData);
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
  Future<List<Booking>>getBookingsForDealer() async {
    String? token =AppStorage.getToken();
    try {
    final url = Uri.parse(AppConstant.BASE_URL+'api/BookingConfirmation/GetBookingsForDealer');
    final response = await http.get(url,
        headers:token != null ? {'Authorization': 'Bearer $token'} : {},
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final bookings = (jsonData['\$values'] as List)
          .map((booking) => Booking.fromJson(booking))
          .toList();
      return bookings;
    } else {
      print('Error: ${response.statusCode}');
      throw Exception('Failed to fetch bookings');
    }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}

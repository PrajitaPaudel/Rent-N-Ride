import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vehicle_rental_frontendui/utils/constants/app_constant.dart';
import 'package:vehicle_rental_frontendui/widgets/user/order/get_all_booking_page.dart';
import 'package:vehicle_rental_frontendui/widgets/user/order/payment_page.dart';
import '../../model/user/booking _confirmation_model.dart';
import '../../model/user/booking_model.dart';
import '../../model/user/booking_payment_list_model.dart';
import '../../model/user/popular_model.dart';
import '../../service/user/booking_service.dart';

import '../../storage/app_storage.dart';
import '../../widgets/common widget/show_custom_snakebar.dart';
import '../../widgets/user/user_dasboard.dart';
import 'package:http/http.dart' as http;




class BookingController extends GetxController {
  final Vehicle? vehicle;
  final BookingModel? bookingModel;

  BookingController({this.bookingModel,  this.vehicle});

  final BookingService _bookingService = BookingService();

  // Controllers for booking details
  int? id;
  DateTime? startDate;
  DateTime? endDate;
  String place = '';
  int? vehicleId;
  String phoneNumber = '';
  String? email;
  String? address;
  String? billingAddress;
  bool insuranceRequired = false;
  String? specialRequests;
  List<XFile>? images = <XFile>[].obs;
  String? userId;

  // Image picker
  final ImagePicker imagePicker = ImagePicker();

  // Method to pick images
  Future<void> pickImages() async {
    var pickedFiles = await imagePicker.pickMultiImage();
    if (pickedFiles != null) {
      images?.addAll(pickedFiles);
    }
  }

  // Method to create a new booking
  Future<void> createBooking({

    required DateTime startDate,
    required DateTime endDate,
    required String place,
    int? vehicleId,
    required String phoneNumber,
    required String? email,
    String? address,
    String? billingAddress,
    required bool insuranceRequired,
    String? specialRequests,
    required List<XFile> images,
  }) async {
    String? userId =AppStorage.getUserId();
    // Convert XFiles to Files
    List<File> imageFiles = images.map((xfile) => File(xfile.path)).toList();

    // Create the booking model
    BookingModel bookingModel = BookingModel(

       id: id,
      startDate: startDate,
      endDate: endDate,
      place: place,
      vehicleId: vehicleId,
      phoneNumber: phoneNumber,
      email: email,
      address: address,
      billingAddress: billingAddress,
      insuranceRequired: insuranceRequired,
      specialRequests: specialRequests,
      files: imageFiles,
      userId: userId,
    );

    // Call the service to upload booking data and images
    try {
      var bookingId = await _bookingService.uploadBookingDetails(bookingModel);
      // var response = await _bookingService.uploadBookingDetails(bookingModel);

      if (bookingId != null) {
        bookingModel.id = bookingId; // Store the booking ID in the model
        showCustomSnakeBar("Booking created successfully", title: "Success", color: Colors.green);
        Get.to(() =>BookingTotalAmountPage(bookingId:bookingId, vehicle: vehicle??Vehicle(),));
      } else {

        showCustomSnakeBar("Booking creation failed", title: "Error", color: Colors.red);
      }
    } catch (e) {
      print('Error: $e');
      showCustomSnakeBar("An error occurred: ${e.toString()}", title: "Error", color: Colors.red);
    }
  }


  final BookingService bookingService = BookingService();
  var bookingTotal = BookingTotalModel(
    rentalCharge: 0.0,
    totalAmountBeforeDiscount: 0.0,
    discountAmount: 0.0,
    totalAmount: 0.0,
    paymentMethods: [],
  ).obs;

  Future<void> fetchBookingTotal(int bookingId) async {
    try {
      print("Fetching booking total for ID: $bookingId");
      final total = await bookingService.getTotalAmount(bookingId);
      bookingTotal.value = total;
    } catch (e) {
      print('${e.toString()}');
      Get.snackbar('Error', 'Failed to load booking details');
    }
  }





  Future<void> confirmBooking(BookingConfirmationModel bookingConfirmation) async {
    String? token = AppStorage.getToken();
    final url = AppConstant.BASE_URL + AppConstant.Confirm_Booking + '${bookingConfirmation.bookingId}';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
        body: jsonEncode(bookingConfirmation.toJson()),
      );

      if (response.statusCode == 200) {
        // Handle success
        Get.to(() => GetAllBooking(bookingId: bookingConfirmation.bookingId));
        print("Booking confirmed successfully!");
        showCustomSnakeBar('Booking confirmed successfully!', title: 'Success', color: Colors.green);
      } else {
        // Handle error
        print("Failed to confirm booking: ${response.statusCode}");
      }
    } catch (e) {
      print("Error in confirming booking: $e");
    }
  }






  Rx<BookingConfirmationInfo?> bookingConfirmationInfo = Rx<BookingConfirmationInfo?>(null);
  Rx<BookingInfo?> bookingInfo = Rx<BookingInfo?>(null);
  RxBool isLoading = true.obs;


  void fetchBookingDetails(int bookingId) async {
    try {
      isLoading(true);
      final data = await bookingService.fetchBookingDetails(bookingId);

      if (data != null) {
        bookingConfirmationInfo.value = data['bookingConfirmation'];
        bookingInfo.value = data['bookingInfo'];
      } else {
        print("Error: Data fetched is null");
      }
    } catch (e) {
      print("Error fetching booking details: $e");
    } finally {
      isLoading(false);
    }
  }
  @override
  void onInit() {
    super.onInit();
    fetchUserBookingDetails();
  }


  var bookingDetailsList = <BookingDetails>[].obs;
  void fetchUserBookingDetails() async {
    try {
      isLoading(true);
      final response = await bookingService.fetchUserBookingDetails();
      bookingDetailsList.value = response.values ?? [];
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
  // Function to edit booking details
//   final BookingService updateBookingService = BookingService();
//
//   Future<void> updateBooking(int bookingId, BookingModel updatedBooking) async {
//     try {
//       await updateBookingService.updateBooking(bookingId, updatedBooking);
//       // Show success message or navigate back
//       Get.snackbar('Success', 'Booking updated successfully');
//     } catch (e) {
//       print('$e');
//       // Handle error (show message or log)
//       Get.snackbar('Error', 'Failed to update booking: $e');
//
//     }
//   }
 }
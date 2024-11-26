
import 'dart:io';


class BookingModel {
    int? id;
   DateTime startDate;
    DateTime? endDate;
  List<File>? files;
  final String place;
  final int? vehicleId;
  final String phoneNumber;
  final String? email;
  final String? address;
  final String? billingAddress;
  final bool insuranceRequired;
  final String? specialRequests;
   final String? userId;


  // Constructor
  BookingModel({
      this.id,
    required this.startDate,
    this.endDate,
    this.files,
    required this.place,
    this.vehicleId,
     this.userId,
    required this.phoneNumber,
    this.email,
    this.address,
    this.billingAddress,
    required this.insuranceRequired,
    this.specialRequests,


  });



  Map<String, dynamic> toJson() {
    final Map<String,dynamic>data=new Map<String,dynamic>();
    data['StartDate']= this.startDate.toIso8601String();
    data['EndDate']= this.endDate?.toIso8601String();
    data['LicenseImgPath']= this.files;
    data['Place']=this.place;
    data['VehicleId']= this.vehicleId;

    data['PhoneNumber']= this.phoneNumber;
    data['Email']= this.email;
    data['Address']=this.address;
    data['BillingAddress']= this.billingAddress;
    data['InsuranceRequired']= this.insuranceRequired;
    data['SpecialRequests']= this.specialRequests;
    data['UserId']= this.userId;

    return data;
  }
}

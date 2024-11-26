// booking_confirmation_model.dart
class BookingConfirmationModel {
  int? totalCount;
  List<Booking>? bookings;

  BookingConfirmationModel({this.totalCount, this.bookings});

  factory BookingConfirmationModel.fromJson(Map<String, dynamic> json) {
    return BookingConfirmationModel(
      totalCount: json['totalCount'],
      bookings: (json['bookings']['\$values'] as List<dynamic>)
          .map((e) => Booking.fromJson(e))
          .toList(),
    );
  }
}

class Booking {
  BookingConfirmationInfo? bookingConfirmationInfo;
  BookingInfo? bookingInfo;

  Booking({this.bookingConfirmationInfo, this.bookingInfo});

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      bookingConfirmationInfo: BookingConfirmationInfo.fromJson(json['bookingConfirmationInfo']),
      bookingInfo: BookingInfo.fromJson(json['bookingInfo']),
    );
  }
}

class BookingConfirmationInfo {
  int? bookingConfirmationId;
  double? totalAmount;
  double? discountAmount;
  double? totalBeforeDiscount;
  String? paymentMethod;
  String? email;

  BookingConfirmationInfo({
    this.bookingConfirmationId,
    this.totalAmount,
    this.discountAmount,
    this.totalBeforeDiscount,
    this.paymentMethod,
    this.email,
  });

  factory BookingConfirmationInfo.fromJson(Map<String, dynamic> json) {
    return BookingConfirmationInfo(
      bookingConfirmationId: json['bookingConfirmationId'],
      totalAmount: json['totalAmount']?.toDouble(),
      discountAmount: json['discountAmount']?.toDouble(),
      totalBeforeDiscount: json['totalBeforeDiscount']?.toDouble(),
      paymentMethod: json['paymentMethod'],
      email: json['email'],
    );
  }
}

class BookingInfo {
  int? id;
  String? startDate;
  String? endDate;
  String? place;
  String? phoneNumber;
  String? email;
  String? address;
  String? billingAddress;
  bool? insuranceRequired;
  String? specialRequests;
  Vehicle? vehicle;

  BookingInfo({
    this.id,
    this.startDate,
    this.endDate,
    this.place,
    this.phoneNumber,
    this.email,
    this.address,
    this.billingAddress,
    this.insuranceRequired,
    this.specialRequests,
    this.vehicle,
  });

  factory BookingInfo.fromJson(Map<String, dynamic> json) {
    return BookingInfo(
      id: json['id'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      place: json['place'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      address: json['address'],
      billingAddress: json['billingAddress'],
      insuranceRequired: json['insuranceRequired'],
      specialRequests: json['specialRequests'],
      vehicle: Vehicle.fromJson(json['vehicle']),
    );
  }
}

class Vehicle {
  int? vehicleId;
  double? price;
  String? model;
  String? brand;
  String? category;
  String? imageUrl;

  Vehicle({this.vehicleId, this.price, this.model, this.brand, this.category, this.imageUrl});

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      vehicleId: json['vehicleId'],
      price: json['price']?.toDouble(),
      model: json['model'],
      brand: json['brand'],
      category: json['category'],
      imageUrl: json['imageUrl'],
    );
  }
}

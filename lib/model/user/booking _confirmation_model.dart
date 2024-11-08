

class BookingConfirmationInfo {
  int? id;
  double? totalAmount;
  double? discountAmount;
  double? totalBeforeDiscount;
  String? paymentMethod;
  String? email;

  BookingConfirmationInfo({
    this.id,
    this.totalAmount,
    this.discountAmount,
    this.totalBeforeDiscount,
    this.paymentMethod,
    this.email,
  });

  factory BookingConfirmationInfo.fromJson(Map<String, dynamic> json) {
    return BookingConfirmationInfo(
      id: json['id'] as int?,
      totalAmount: json['totalAmount'] as double?,
      discountAmount: json['discountAmount'] as double?,
      totalBeforeDiscount: json['totalBeforeDiscount'] as double?,
      paymentMethod: json['paymentMethod'] as String?,
      email: json['email'] as String?,  // Allows email to be null
    );
  }
}


class BookingInfo {
  final int? id;
  final String? startDate;
  final String? endDate;
  final String? place;
  final String? phoneNumber;
  final String? email;
  final String? address;
  final String? billingAddress;
  final bool insuranceRequired;
  final String? specialRequests;
  final Vvehicle? vehicle;

  BookingInfo({
     this.id,
     this.startDate,
     this.endDate,
     this.place,
    this.phoneNumber,
     this.email,
     this.address,
     this.billingAddress,
    required this.insuranceRequired,
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
      vehicle: Vvehicle.fromJson(json['vehicle']),
    );
  }
}

class Vvehicle {
  final int vehicleId;
  final double price;
  final String model;
  final String brand;
  final String category;
  final String imageUrl;

  Vvehicle({
    required this.vehicleId,
    required this.price,
    required this.model,
    required this.brand,
    required this.category,
    required this.imageUrl,
  });

  factory Vvehicle.fromJson(Map<String, dynamic> json) {
    return Vvehicle(
      vehicleId: json['vehicleId'],
      price: json['price'],
      model: json['model'],
      brand: json['brand'],
      category: json['category'],
      imageUrl: json['imageUrl'],
    );
  }
}

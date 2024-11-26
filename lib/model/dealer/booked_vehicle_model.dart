class Booking {
  final int? id;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? place;
  final String? phoneNumber;
  final String? email;
  final String? address;
  final String? billingAddress;
  final bool? insuranceRequired;
  final String? specialRequests;
  final Vehicle? vehicle;

  Booking({
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

  factory Booking.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Booking();
    return Booking(
      id: json['id'] as int?,
      startDate: json['startDate'] != null
          ? DateTime.parse(json['startDate'])
          : null,
      endDate: json['endDate'] != null
          ? DateTime.parse(json['endDate'])
          : null,
      place: json['place'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      billingAddress: json['billingAddress'] as String?,
      insuranceRequired: json['insuranceRequired'] as bool?,
      specialRequests: json['specialRequests'] as String?,
      vehicle: Vehicle.fromJson(json['vehicle'] as Map<String, dynamic>?),
    );
  }
}

class Vehicle {
  final int? vehicleId;
  final double? price;
  final String? model;
  final String? brand;
  final String? category;
  final String? imageUrl;

  Vehicle({
    this.vehicleId,
    this.price,
    this.model,
    this.brand,
    this.category,
    this.imageUrl,
  });

  factory Vehicle.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Vehicle();
    return Vehicle(
      vehicleId: json['vehicleId'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      model: json['model'] as String?,
      brand: json['brand'] as String?,
      category: json['category'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );
  }
}

class RentalHistoryModel {
  String? id;
  List<Values>? values;

  RentalHistoryModel({this.id, this.values});

  RentalHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['\$id']; // Correct mapping for '$id'
    if (json['\$values'] != null) { // Correct mapping for '$values'
      values = <Values>[];
      json['\$values'].forEach((v) {
        values!.add(Values.fromJson(v));
      });
    }
  }
}

class Values {
  String? id;
  int? bookingId;
  String? startDate;
  String? endDate;
  String? place;
  String? actualReturnDate;
  String? damageReported;
  int? totalAmount;
  String? paymentMethod;
  int? rating;
  String? vehicleModel;
  String? vehicleCategory;
  String? vehicleBrand;
  List<String>? vehicleImages;
  String? vehicleImageUrl;

  Values({
    this.id,
    this.bookingId,
    this.startDate,
    this.endDate,
    this.place,
    this.actualReturnDate,
    this.damageReported,
    this.totalAmount,
    this.paymentMethod,
    this.rating,
    this.vehicleModel,
    this.vehicleCategory,
    this.vehicleBrand,
    this.vehicleImages,
    this.vehicleImageUrl,
  });

  Values.fromJson(Map<String, dynamic> json) {
    id = json['\$id'];
    bookingId = json['bookingId'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    place = json['place'];
    actualReturnDate = json['actualReturnDate'];
    damageReported = json['damageReported'];

    // Safely parse totalAmount for both int and double
    totalAmount = (json['totalAmount'] is int)
        ? json['totalAmount']
        : (json['totalAmount'] as double?)?.toInt();

    paymentMethod = json['paymentMethod'];
    rating = json['rating'];
    vehicleModel = json['vehicleModel'];
    vehicleCategory = json['vehicleCategory'];
    vehicleBrand = json['vehicleBrand'];

    // Parse nested vehicleImages
    if (json['vehicleImages'] != null && json['vehicleImages']['\$values'] != null) {
      vehicleImages = List<String>.from(json['vehicleImages']['\$values']);
    }

    vehicleImageUrl = json['vehicleImageUrl'];
  }
}


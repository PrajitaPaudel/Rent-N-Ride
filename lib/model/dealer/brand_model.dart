// class VehicleBrandModel {
//   int id;
//   String name;
//
//   VehicleBrandModel({required this.id, required this.name});
//
//   factory VehicleBrandModel.fromJson(Map<String, dynamic> json) {
//     return VehicleBrandModel(
//       id: json['id'],
//       name: json['name'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//     };
//   }
// }


class VehicleBrandModel {
  final int brandId;
  final String vehicleBrandName;
  final double rentalCharge;

  VehicleBrandModel({
    required this.brandId,
    required this.vehicleBrandName,
    required this.rentalCharge,
  });

  // Factory method to create an instance from JSON
  factory VehicleBrandModel.fromJson(Map<String, dynamic> json) {
    return VehicleBrandModel(
      brandId: json['brandId'],
      vehicleBrandName: json['vehicleBrandName'],
      rentalCharge: json['rentalCharge'].toDouble(),
    );
  }
}

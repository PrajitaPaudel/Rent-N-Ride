// class VehicleCategoryModel {
//   int id;
//   String name;
//
//   VehicleCategoryModel({required this.id, required this.name});
//
//   factory VehicleCategoryModel.fromJson(Map<String, dynamic> json) {
//     return VehicleCategoryModel(
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


class VehicleCategoryModel {
  final int categoryId;
  final String vehicleCategoryName;

  VehicleCategoryModel({
    required this.categoryId,
    required this.vehicleCategoryName,
  });

  // Factory method to create an instance from JSON
  factory VehicleCategoryModel.fromJson(Map<String, dynamic> json) {
    return VehicleCategoryModel(
      categoryId: json['categoryId'],
      vehicleCategoryName: json['vehicleCategoryName'],
    );
  }
}
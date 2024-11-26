// class VehicleCategoryModel {
//   List<Vehicle>? values;
//
//   VehicleCategoryModel({this.values});
//
//   VehicleCategoryModel.fromJson(Map<String, dynamic> json) {
//     if (json['\$values'] != null) {
//       values = (json['\$values'] as List).map((v) => Vehicle.fromJson(v)).toList();
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       '\$values': values?.map((v) => v.toJson()).toList(),
//     };
//   }
// }
//
// class Vehicle {
//   int? vehicleId;
//   double? price;
//   String? detail;
//   List<VehicleImage>? vehicleImages;
//   bool? popular;
//   String? damage;
//   bool? available;
//   int? modelId;
//   Model? model;
//   Brand? brand;
//   Category? category;
//
//   Vehicle({
//     this.vehicleId,
//     this.price,
//     this.detail,
//     this.vehicleImages,
//     this.popular,
//     this.damage,
//     this.available,
//     this.modelId,
//     this.model,
//     this.brand,
//     this.category,
//   });
//
//   Vehicle.fromJson(Map<String, dynamic> json) {
//     vehicleId = json['vehicleId'];
//     price = (json['price'] as num?)?.toDouble();
//     detail = json['detail'];
//
//     if (json['vehicleImages'] != null && json['vehicleImages']['\$values'] != null) {
//       vehicleImages = (json['vehicleImages']['\$values'] as List)
//           .map((v) => VehicleImage.fromJson(v))
//           .toList();
//     }
//
//     popular = json['popular'];
//     damage = json['damage'];
//     available = json['available'];
//     modelId = json['modelId'];
//     model = json['model'] != null ? Model.fromJson(json['model']) : null;
//     brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
//     category = json['category'] != null ? Category.fromJson(json['category']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'vehicleId': vehicleId,
//       'price': price,
//       'detail': detail,
//       'vehicleImages': vehicleImages != null
//           ? {
//         '\$values': vehicleImages!.map((v) => v.toJson()).toList(),
//       }
//           : null,
//       'popular': popular,
//       'damage': damage,
//       'available': available,
//       'modelId': modelId,
//       'model': model?.toJson(),
//       'brand': brand?.toJson(),
//       'category': category?.toJson(),
//     };
//   }
// }
//
// class VehicleImage {
//   String? imagePath;
//
//   VehicleImage({this.imagePath});
//
//   VehicleImage.fromJson(Map<String, dynamic> json) {
//     imagePath = json['imagePath'];
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'imagePath': imagePath,
//     };
//   }
// }
//
// class Model {
//   String? id;
//   int? modelId;
//   String? vehicleModelName;
//
//   Model({this.id, this.modelId, this.vehicleModelName});
//
//   Model.fromJson(Map<String, dynamic> json) {
//     id = json['\$id'];
//     modelId = json['modelId'];
//     vehicleModelName = json['vehicleModelName'];
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       '\$id': id,
//       'modelId': modelId,
//       'vehicleModelName': vehicleModelName,
//     };
//   }
// }
//
// class Brand {
//   String? vehicleBrandName;
//
//   Brand({this.vehicleBrandName});
//
//   Brand.fromJson(Map<String, dynamic> json) {
//     vehicleBrandName = json['vehicleBrandName'];
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'vehicleBrandName': vehicleBrandName,
//     };
//   }
// }
//
// class Category {
//   String? vehicleCategoryName;
//
//   Category({this.vehicleCategoryName});
//
//   Category.fromJson(Map<String, dynamic> json) {
//     vehicleCategoryName = json['vehicleCategoryName'];
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'vehicleCategoryName': vehicleCategoryName,
//     };
//   }
// }

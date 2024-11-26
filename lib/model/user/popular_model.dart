class PopularModel {
  List<Vehicle>? values;

  PopularModel({this.values});

  PopularModel.fromJson(Map<String, dynamic> json) {
    if (json['\$values'] != null) {
      values = (json['\$values'] as List).map((v) => Vehicle.fromJson(v)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      '\$values': values?.map((v) => v.toJson()).toList(),
    };
  }


}

class Vehicle {
  int? vehicleId;
  double? price;
  String? detail;
  List<VehicleImage>? vehicleImages;
  bool? popular;
  String? damage;
  bool? available;
  int? modelId;
  Model? model;
  Brand? brand;
  Category? category;
   String? address; // Add address field
 String? billingAddress; // Add billing address field
   String? phoneNumber; // Add phone number field
   String? specialRequests; // Add special requests field
 DateTime? startDate; // Add start date field
   DateTime? endDate; // Add end date field
  bool? insuranceRequired;
  String? userId;

  Vehicle({
    this.vehicleId,
    this.price,
    this.detail,
    this.vehicleImages,
    this.popular,
    this.damage,
    this.available,
    this.modelId,
    this.model,
    this.brand,
    this.category,
    this.address,
    this.billingAddress,
     this.phoneNumber,
     this.specialRequests,
     this.startDate,
     this.endDate,
     this.insuranceRequired,
    this.userId,

  });

  Vehicle.fromJson(Map<String, dynamic> json) {
    vehicleId = json['vehicleId'];
    price = (json['price'] as num?)?.toDouble();
    detail = json['detail'];

    if (json['vehicleImages'] != null && json['vehicleImages']['\$values'] != null) {
      vehicleImages = (json['vehicleImages']['\$values'] as List)
          .map((v) => VehicleImage.fromJson(v))
          .toList();
    }

    popular = json['popular'];
    damage = json['damage'];
    available = json['available'];
    modelId = json['modelId'];
    userId = json['userId'];
    model = json['model'] != null ? Model.fromJson(json['model']) : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'vehicleId': vehicleId,
      'price': price,
      'detail': detail,
      'vehicleImages': vehicleImages != null
          ? {
        '\$values': vehicleImages!.map((v) => v.toJson()).toList(),
      }
          : null,
      'popular': popular,
      'damage': damage,
      'available': available,
      'modelId': modelId,
      'model': model?.toJson(),
      'brand': brand?.toJson(),
      'category': category?.toJson(),
    };
  }
}

class VehicleImage {
  String? imagePath;

  VehicleImage({this.imagePath});

  VehicleImage.fromJson(Map<String, dynamic> json) {
    imagePath = json['imagePath'];
  }

  Map<String, dynamic> toJson() {
    return {
      'imagePath': imagePath,
    };
  }
}

class Model {
  String? id;
  int? modelId;
  String? vehicleModelName;
  String? ref;

  Model({this.id, this.modelId, this.vehicleModelName, this.ref});

  Model.fromJson(Map<String, dynamic> json) {
    id = json['\$id'];
    modelId = json['modelId'];
    vehicleModelName = json['vehicleModelName'];
    ref = json['\$ref'];
  }

  Map<String, dynamic> toJson() {
    return {
      '\$id': id,
      'modelId': modelId,
      'vehicleModelName': vehicleModelName,
      '\$ref': ref,
    };
  }
}

class Brand {
  int? brandId;
  String? vehicleBrandName;

  Brand({this.vehicleBrandName,this.brandId});

  Brand.fromJson(Map<String, dynamic> json) {
    vehicleBrandName = json['vehicleBrandName'];
    brandId=json['brandId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'vehicleBrandName': vehicleBrandName,
    };
  }
}

class Category {
  int? categoryId;
  String? vehicleCategoryName;

  Category({this.vehicleCategoryName,this.categoryId});

  Category.fromJson(Map<String, dynamic> json) {
    vehicleCategoryName = json['vehicleCategoryName'];
    categoryId=json['categoryId'];
  }



  Map<String, dynamic> toJson() {
    return {
      'vehicleCategoryName': vehicleCategoryName,
    };
  }
}


class AllVehicleModel {
  int totalCount;
  List<Vehicle> vehicles;

  AllVehicleModel({required this.totalCount, required this.vehicles});

  factory AllVehicleModel.fromJson(Map<String, dynamic> json) {
    return AllVehicleModel(
      totalCount: json['totalCount'] ?? 0,
      vehicles: (json['vehicles']['\$values'] as List)
          .map((vehicle) => Vehicle.fromJson(vehicle))
          .toList(),
    );
  }
}

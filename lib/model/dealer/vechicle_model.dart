class VehicleModel {
  final int? modelId;
  final String vehicleModelName;

  VehicleModel({
     this.modelId,
    required this.vehicleModelName,
  });

  Map<String, dynamic> toJson() {
    return {
      'VehicleModelName': vehicleModelName,

    };
  }

  // Factory method to create an instance from JSON
  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      modelId: json['modelId'],
      vehicleModelName: json['vehicleModelName'],
    );
  }
}

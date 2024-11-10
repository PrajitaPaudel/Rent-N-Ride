class VehicleModel {
  final int modelId;
  final String vehicleModelName;

  VehicleModel({
    required this.modelId,
    required this.vehicleModelName,
  });

  // Factory method to create an instance from JSON
  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      modelId: json['modelId'],
      vehicleModelName: json['vehicleModelName'],
    );
  }
}

class AdminEarningsModel {
  final double totalAdminEarnings;

  AdminEarningsModel({required this.totalAdminEarnings});

  factory AdminEarningsModel.fromJson(Map<String, dynamic> json) {
    return AdminEarningsModel(
      totalAdminEarnings: json['totalAdminEarnings'] ?? 0.0,
    );
  }
}


class DealerEarningsModel {
  final double totalDealerEarnings;

  DealerEarningsModel({required this.totalDealerEarnings});

  factory DealerEarningsModel.fromJson(Map<String, dynamic> json) {
    return DealerEarningsModel(
      totalDealerEarnings: json['totalDealerEarnings'] ?? 0.0,
    );
  }
}
class ReturnConfirmationModel {
  final double totalAmountBeforeFees;
  final double totalLateFees;
  final double damageFee;
  final List<String> paymentMethods;

  ReturnConfirmationModel({
    required this.totalAmountBeforeFees,
    required this.totalLateFees,
    required this.damageFee,
    required this.paymentMethods,
  });

  factory ReturnConfirmationModel.fromJson(Map<String, dynamic> json) {
    return ReturnConfirmationModel(
      totalAmountBeforeFees: (json["totalAmountBeforeFees"] ?? 0).toDouble(),
      totalLateFees: (json["totalLateFees"] ?? 0).toDouble(),
      damageFee: (json["damageFee"] ?? 0).toDouble(),
      paymentMethods: List<String>.from(json["paymentMethods"] ?? []),
    );
  }
}


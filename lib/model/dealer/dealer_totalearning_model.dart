class DealerEarnings {
  final double totalDealerEarnings;

  DealerEarnings({required this.totalDealerEarnings});

  factory DealerEarnings.fromJson(Map<String, dynamic> json) {
    return DealerEarnings(
      totalDealerEarnings: json['totalDealerEarnings']??0.0,
    );
  }
}

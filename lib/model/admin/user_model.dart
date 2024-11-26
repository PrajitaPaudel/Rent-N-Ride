class UserModel {
  final String id;
  final String userName;
  final String firstName;
  final String lastName;
  final String emailId;
  final String contactNo;
  final String address;
  final String driverLicInfo;
  final String userType;
  final bool isBlocked;
  final String? blockedUntil;

  UserModel({
    required this.id,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.emailId,
    required this.contactNo,
    required this.address,
    required this.driverLicInfo,
    required this.userType,
    required this.isBlocked,
    this.blockedUntil,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      userName: json['userName'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      emailId: json['emailId'],
      contactNo: json['contactNo'],
      address: json['address'],
      driverLicInfo: json['driverLicInfo'],
      userType: json['userType'],
      isBlocked: json['isBlocked'],
      blockedUntil: json['blockedUntil'],
    );
  }
}

class UserListModel {
  final int totalUsers;
  final List<UserModel> users;

  UserListModel({
    required this.totalUsers,
    required this.users,
  });

  factory UserListModel.fromJson(Map<String, dynamic> json) {
    return UserListModel(
      totalUsers: json['totalUsers'],
      users: List<UserModel>.from(json['users']['\$values'].map((user) => UserModel.fromJson(user))),
    );
  }
}

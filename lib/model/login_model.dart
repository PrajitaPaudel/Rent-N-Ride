class LoginModel {
  String? id;  // Make id nullable
  String? userName;
  String? firstName;
  String? lastName;
  String? userId;
  String? password;
  String? email;
  String? contactNo;
  String? address;
  String? driverLicInfo;
  String? userType;
  String? token;  // Add this line to include the token

  // Constructor with the token included
  LoginModel({
    this.id,  // id can be nullable now
    this.userName,
    this.firstName,
    this.lastName,
    this.password,
    this.email,
    this.contactNo,
    this.userId,
    this.address,
    this.driverLicInfo,
    this.userType,
    this.token,
  });

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'contactNo': contactNo,
      'address': address,
      'email': email,
      'driverLicInfo': driverLicInfo,
      'userType': userType,
      'token': token, // Add token to JSON conversion
      'id': id,  // Include id in the JSON conversion
    };
  }

  // Factory constructor to create an instance from JSON
  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['$id'];  // Extract id from the response
    userName = json['userName'];
    userId=json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    password = json['password'];
    email = json['email'];
    contactNo = json['contactNo'];
    address = json['address'];
    driverLicInfo = json['driverLicInfo'];
    userType = json['userType'];
    token = json['token'];  // Extract token from the response
  }
}

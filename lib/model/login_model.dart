class LoginModel {
  String? id;  
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
  String? token;  

 
  LoginModel({
    this.id,  
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
      'token': token, 
      'id': id,  
    };
  }

  
  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['$id']; 
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
    token = json['token']; 
  }
}

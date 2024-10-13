class LoginModel {
  int? id;
  String? userName;
  String? firstName;
  String? lastName;
  String? password;
  String? emailId;
  String? contactNo;
  String? address;
  Null altEmail;
  Null altContact;
  String? driverLicInfo;
  String? userType;

  LoginModel(
      {this.id,
        this.userName,
        this.firstName,
        this.lastName,
        this.password,
        this.emailId,
        this.contactNo,
        this.address,
        this.altEmail,
        this.altContact,
        this.driverLicInfo,
        this.userType});

  Map<String, dynamic> toJson() {
    return {
      'userName':userName,
      'firstName': firstName,
      'lastName':lastName,
      'password':password,
      'contactNo': contactNo,
      'address':address,
      'emailId': emailId,
      'driverLicInfo': driverLicInfo,
      'userType': userType,
    };
  }

  // Factory constructor to create an instance from JSON
  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    password = json['password'];
    emailId = json['emailId'];
    contactNo = json['contactNo'];
    address = json['address'];
    altEmail = json['altEmail'];
    altContact = json['altContact'];
    driverLicInfo = json['driverLicInfo'];
    userType = json['userType'];
  }


}

class SignUpBody{
  String uname;
  String fname;
  String lname;
  String email;
  String contact;
  String address;
  String? altEmail;
  String? altContact;
  String password;
  String driverL;
  String userType;


  SignUpBody({
    required this.uname,
    required this.fname,
    required this.lname,
    required this.contact,
    required this.email,
    required this.address,
    this.altEmail,
    this.altContact,
    required this.password,
    required this.driverL,
    required this.userType,



});
Map<String,dynamic> toJson(){
    final Map<String,dynamic> data =new Map<String,dynamic>();
    data["UserName"]=this.uname;
    data["FirstName"]=this.fname;
    data["LastName"]=this.lname;
    data["Password"]=this.password;
    data["EmailId"]=this.email;
    data["ContactNo"]=this.contact;
    data["Address"]=this.address;
    data["AtlEmail"]=this.altEmail;
    data ["AtlContact"]=this.altContact;
    data["DriverLicInfo"]=this.driverL;
    data["UserType"]=this.userType;
    return data;
}

}
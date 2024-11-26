
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class VRegistrationBody{
  final int vehicleId;
  int categoryId;
  int modelId;
  int brandId;
  String price;
  String damage;
  bool available;
  bool popular;
  List<File>? files;
  String description;
  String? userId;





  VRegistrationBody({
    required this.vehicleId,
    required this.categoryId,
    required this.modelId,
    required this.brandId,
    required this.price,
    required this.damage,
    required this.available,
    required this.popular,
    required this.files,
   required this.description,
    required this.userId,
    // required this.userName,

});

  Map<String,dynamic>toJson(){
    final Map<String,dynamic>data=new Map<String,dynamic>();
       data["VehicleId"]=this.vehicleId;
      data["CategoryId"]=this.categoryId;
      data["ModelId"]=this.modelId;
      data["BrandId"]=this.brandId;
      data["Price"]=this.price;
      data["Damage"]=this.damage;
      data["Available"]=this.available;
      data["Popular"]=this.popular;
      data['Detail']=this.description;
       data["UserId"]=this.userId;
       data["ImagePath"]=this.files;
       // data["UserName"]=this.userName;
      return data;

  }
}




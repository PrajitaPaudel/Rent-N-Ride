
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class VRegistrationBody{
  int categoryId;
  int modelId;
  int brandId;
  String price;
  String damage;
  String available;
  String popular;
  List<File>? files;
  String description;




  VRegistrationBody({
    required this.categoryId,
    required this.modelId,
    required this.brandId,
    required this.price,
    required this.damage,
    required this.available,
    required this.popular,
    required this.files,
   required this.description

});

  Map<String,dynamic>toJson(){
    final Map<String,dynamic>data=new Map<String,dynamic>();
      data["CategoryId"]=this.categoryId;
      data["ModelId"]=this.modelId;
      data["BrandId"]=this.brandId;
      data["Price"]=this.price;
      data["Damage"]=this.damage;
      data["Available"]=this.available;
      data["Popular"]=this.popular;
      data["Remarks"]=this.description;
       data["ImagePath"]=this.files;
      return data;

  }
}




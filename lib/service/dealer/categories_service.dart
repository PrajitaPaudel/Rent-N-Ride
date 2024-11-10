import 'package:vehicle_rental_frontendui/model/dealer/category_model.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vehicle_rental_frontendui/utils/constants/app_constant.dart';

import '../../model/dealer/brand_model.dart';
import '../../model/dealer/vechicle_model.dart';

class CategoryService {



  // Method to fetch all categories
  Future<List<VehicleCategoryModel>> fetchCategories() async {
    final response = await http.get(Uri.parse(AppConstant.BASE_URL+AppConstant.Get_Categories));

    if (response.statusCode == 200) {
      print(response.statusCode);
      final data = json.decode(response.body)['\$values'];
      return data.map<VehicleCategoryModel>((json) => VehicleCategoryModel.fromJson(json)).toList();

    } else {
      throw Exception('Failed to load vehicle categories');
    }
  }
}




class BrandService {
  Future<List<VehicleBrandModel>> fetchBrands() async {
    final response = await http.get(Uri.parse(AppConstant.BASE_URL + AppConstant.Get_Brand));

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['\$values'];
      return data.map<VehicleBrandModel>((json) => VehicleBrandModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load vehicle brands');
    }
  }
}


class VehicleModelService {
  Future<List<VehicleModel>> fetchModels() async {
    final response = await http.get(Uri.parse(AppConstant.BASE_URL + AppConstant.Get_Model));

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['\$values'];
      return data.map<VehicleModel>((json) => VehicleModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load vehicle models');
    }
  }
}
import 'package:vehicle_rental_frontendui/model/dealer/category_model.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vehicle_rental_frontendui/utils/constants/app_constant.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/show_custom_snakebar.dart';

import '../../model/dealer/brand_model.dart';
import '../../model/dealer/vechicle_model.dart';
import '../../storage/app_storage.dart';
import '../../utils/constants/colors.dart';

class CategoryService {



  // Method to fetch all categories
  Future<List<VehicleCategoryModel>> fetchCategories() async {
    String? token = AppStorage.getToken();
    final response = await http.get(Uri.parse(AppConstant.BASE_URL+AppConstant.Get_Categories),
      headers: token != null ? {'Authorization': 'Bearer $token'} : {},);

    if (response.statusCode == 200) {
      print(response.statusCode);
      final data = json.decode(response.body)['\$values'];
      return data.map<VehicleCategoryModel>((json) => VehicleCategoryModel.fromJson(json)).toList();

    } else {
      throw Exception('Failed to load vehicle categories');
    }
  }


  Future<dynamic> addVehicleCategory(VehicleCategoryModel category) async {
    String? token = AppStorage.getToken();
    final String url = AppConstant.BASE_URL +
        AppConstant.Add_Categories;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(category.toJson()),
      );
      print('Request body: ${jsonEncode(category.toJson())}');
      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        int categoryId = responseBody["categoryId"];
        print("categoryId: $categoryId");
        return categoryId;
      } else {
        print("Failed to add category: ${response.statusCode}");
        print("Response body: ${response.body}");
        throw Exception(
            "Failed to add category, response code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: ${e.toString()}");
      throw Exception("Error adding category: ${e.toString()}");
    }
  }

  Future<bool> updateVehicleCategory( int? categoryId,VehicleCategoryModel updatedCategory) async {
    String? token = AppStorage.getToken();
    final String url = '${AppConstant.BASE_URL}${AppConstant.Update_Categories}$categoryId';

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(updatedCategory.toJson()),
      );

      if (response.statusCode == 200) {
        print("Vehicle Category updated successfully.");
        showCustomSnakeBar("Vehicle Category updated successfully.",color: TColors.success,title: 'Success');
        return true;
      } else {
        print("Failed to update Category: ${response.statusCode}");
        print("Response body: ${response.body}");
        showCustomSnakeBar("Failed to update Category.");
        return false;
      }
    } catch (e) {
      showCustomSnakeBar("Failed to update Category.");
      print("Error: ${e.toString()}");
      throw Exception("Error updating Category: ${e.toString()}");
    }
  }


  Future<VehicleCategoryModel?> fetchCategoryById(int id) async {
    String? token = AppStorage.getToken();
    final String url = '${AppConstant.BASE_URL}${AppConstant.Get_Categories_By_Id}$id';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        return  VehicleCategoryModel.fromJson(responseBody);
      } else {
        print("Failed to fetch category: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: ${e.toString()}");
      throw Exception("Error fetching category: ${e.toString()}");
    }
  }

}





class BrandService {
  Future<List<VehicleBrandModel>> fetchBrands() async {
    String? token = AppStorage.getToken();

    // Ensure headers are added correctly
    final response = await http.get(
      Uri.parse(AppConstant.BASE_URL + AppConstant.Get_Brand),
      headers: token != null ? {'Authorization': 'Bearer $token'} : {
      }, // Add token to headers
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['\$values'];
      return data.map<VehicleBrandModel>((json) =>
          VehicleBrandModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load vehicle brands');
    }
  }


  Future<int?> addVehicleBrand(VehicleBrandModel brand) async {
    String? token = AppStorage.getToken();
    final String url = AppConstant.BASE_URL +
        AppConstant.Add_Brand;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
           'Authorization': 'Bearer $token',
        },
        body: jsonEncode(brand.toJson()),
      );
      print('Request body: ${jsonEncode(brand.toJson())}');
      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        int brandId = responseBody["brandId"];
        print("BrandId: $brandId");
        return brandId;
      } else {
        print("Failed to add brand: ${response.statusCode}");
        print("Response body: ${response.body}");
        throw Exception(
            "Failed to add brand, response code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: ${e.toString()}");
      throw Exception("Error adding brand: ${e.toString()}");
    }
  }
  Future<VehicleBrandModel?> fetchBrandById(int id) async {
    String? token = AppStorage.getToken();
    final String url = '${AppConstant.BASE_URL}${AppConstant.Get_Vehicle_Brand_By_Id}$id';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        return VehicleBrandModel.fromJson(responseBody);
      } else {
        print("Failed to fetch brand: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: ${e.toString()}");
      throw Exception("Error fetching brand: ${e.toString()}");
    }
  }


  Future<bool> updateVehicleBrand(int brandId, VehicleBrandModel updatedBrand) async {
    String? token = AppStorage.getToken();
    final String url = '${AppConstant.BASE_URL}${AppConstant.Update_Brand}$brandId';

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(updatedBrand.toJson()),
      );

      if (response.statusCode == 200) {
        print("Vehicle Brand updated successfully.");
        showCustomSnakeBar("Vehicle Brand updated successfully.",color: TColors.success,title: 'Success');
        return true;
      } else {
        print("Failed to update brand: ${response.statusCode}");
        print("Response body: ${response.body}");
        showCustomSnakeBar("Failed to update brand.");
        return false;
      }
    } catch (e) {
      showCustomSnakeBar("Failed to update brand.");
      print("Error: ${e.toString()}");
      throw Exception("Error updating brand: ${e.toString()}");
    }
  }
}

class DeleteBrandService {
  Future<void> deleteBrand(int brandId) async {
    String? token = AppStorage.getToken();
    final String url = '${AppConstant.BASE_URL}${AppConstant.Delete_Brand}$brandId';

    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: token != null ? {'Authorization': 'Bearer $token'} : {},
      );

      if (response.statusCode == 200) {
        print(response.statusCode);
        print("Vehicle Category deleted successfully");
      } else {
        print(response.body);
        print("Failed to delete category: ${response.body}");
        throw Exception("Failed to delete category");
      }
    } catch (error) {

      print("Error: $error");
      throw error;
    }
  }



  Future<void> deleteCategory(int categoryId) async {
    String? token = AppStorage.getToken();
    final String url = '${AppConstant.BASE_URL}${AppConstant.Delete_Categories}$categoryId';

    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: token != null ? {'Authorization': 'Bearer $token'} : {},
      );

      if (response.statusCode == 200) {
        print(response.statusCode);
        print("Vehicle deleted successfully");
      } else {
        print(response.body);
        print("Failed to delete vehicle: ${response.body}");
        throw Exception("Failed to delete Brand");
      }
    } catch (error) {

      print("Error: $error");
      throw error;
    }
  }

  Future<void> deleteModel(int modelId) async {
    String? token = AppStorage.getToken();
    final String url = '${AppConstant.BASE_URL}${AppConstant.Delete_Model}$modelId';

    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: token != null ? {'Authorization': 'Bearer $token'} : {},
      );

      if (response.statusCode == 200) {
        print(response.statusCode);
        print("Vehicle Model deleted successfully");
      } else {
        print(response.body);
        print("Failed to delete vehicle Model: ${response.body}");
        throw Exception("Failed to delete Model");
      }
    } catch (error) {

      print("Error: $error");
      throw error;
    }
  }
}





  class VehicleModelService {
  Future<List<VehicleModel>> fetchModels() async {
    String? token = AppStorage.getToken();
    final response = await http.get(Uri.parse(AppConstant.BASE_URL + AppConstant.Get_Model),headers: token != null ? {'Authorization': 'Bearer $token'} : {},);

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['\$values'];
      return data.map<VehicleModel>((json) => VehicleModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load vehicle models');
    }
  }
  Future<dynamic> addVehicleModel(VehicleModel model) async {
    String? token = AppStorage.getToken();
    final String url = AppConstant.BASE_URL +
        AppConstant.Add_Model;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(model.toJson()),
      );
      print('Request body: ${jsonEncode(model.toJson())}');
      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        int modelId = responseBody["modelID"];
        print("categoryId: $modelId");
        return modelId;
      } else {
        print("Failed to add VehicleModel: ${response.statusCode}");
        print("Response body: ${response.body}");
        throw Exception(
            "Failed to add VehicleModel, response code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: ${e.toString()}");
      throw Exception("Error adding VehicleModel: ${e.toString()}");
    }
  }

  Future<bool> updateVehicleModel( int? modelId,VehicleModel updatedModel) async {
    String? token = AppStorage.getToken();
    final String url = '${AppConstant.BASE_URL}${AppConstant.Update_Model}$modelId';

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(updatedModel.toJson()),
      );

      if (response.statusCode == 200) {
        print("Vehicle model updated successfully.");
        showCustomSnakeBar("Vehicle model updated successfully.",color: TColors.success,title: 'Success');
        return true;
      } else {
        print("Failed to update model: ${response.statusCode}");
        print("Response body: ${response.body}");
        showCustomSnakeBar("Failed to update brand.");
        return false;
      }
    } catch (e) {
      showCustomSnakeBar("Failed to update model.");
      print("Error: ${e.toString()}");
      throw Exception("Error updating model: ${e.toString()}");
    }
  }

  Future<VehicleModel?> fetchModelById(int id) async {
    String? token = AppStorage.getToken();
    final String url = '${AppConstant.BASE_URL}${AppConstant.Get_Model_By_Id}$id';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        return  VehicleModel.fromJson(responseBody);
      } else {
        print("Failed to fetch Model: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: ${e.toString()}");
      throw Exception("Error fetching Model: ${e.toString()}");
    }
  }

  }





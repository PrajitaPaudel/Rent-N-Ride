import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_frontendui/widgets/admin/display/display_category_page.dart';

import '../../model/dealer/category_model.dart';
import '../../service/dealer/categories_service.dart';
import '../../storage/app_storage.dart';
import '../../utils/constants/colors.dart';
import '../../widgets/admin/display/admin_dashboard_page.dart';
import '../../widgets/admin/display/display_brand.dart';
import '../../widgets/common widget/show_custom_snakebar.dart';
import '../../widgets/dealer/dealer_dashboard_page.dart';

class VCategoryController extends GetxController {
  final CategoryService categoryService = CategoryService();

  var categories = <VehicleCategoryModel>[].obs;
  var isLoading = true.obs;
  var selectedCategoryId = Rxn<int>();
  var currentBrand = Rxn<VehicleCategoryModel>();
  final userType = AppStorage.getUserType();

  @override
  void onInit() {
    super.onInit();
    loadCategories(); 
  }

  void loadCategories() async {
    try {
      isLoading(true);
      categories.value = await categoryService.fetchCategories();
    } finally {
      isLoading(false);
    }
  }

  void selectCategory(int id) {
    selectedCategoryId.value = id;
    print('Selected category ID: $id');
  }
  Future<void> loadBrandDetails(int id) async {
    isLoading(true);
    try {
      currentBrand.value = await categoryService.fetchCategoryById(id);
    } catch (e) {
      print("Error loading Category details: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> addVehicleCategory(String categoryName) async {
    VehicleCategoryModel newCategory =VehicleCategoryModel(
        vehicleCategoryName: categoryName,);
    try {
      await categoryService.addVehicleCategory(newCategory);
      showCustomSnakeBar('Category add Successfully',title:'Success',color: TColors.success );
      if (userType == 'Admin') {
        Get.to(() => AdminDashboardPage());
      }else {
        Get.to(() => DealerDashboardPage());
      }
    } catch (e) {
      throw e;
    }
  }
  Future<void> updateVehicleCategory(int? categoryId, String vehicleCategoryName) async {
    VehicleCategoryModel updatedCategory = VehicleCategoryModel(vehicleCategoryName: vehicleCategoryName,categoryId: categoryId
        );

    try {
      await categoryService.updateVehicleCategory(categoryId, updatedCategory);
      if (userType == 'Admin') {
        Get.to(() => AdminDashboardPage());
      }else {
        Get.to(() => DealerDashboardPage());
      }
    } catch (e) {
      throw e;
    }
  }


  final DeleteBrandService _deleteBrandService = DeleteBrandService();

  Future<void> deleteCategory(int? categoryId) async {
    bool confirmDelete = await _showConfirmationDialog();
    if (!confirmDelete) return;

    try {
      await _deleteBrandService.deleteCategory(categoryId!);
      showCustomSnakeBar("Vehicle deleted successfully.", color: Colors.green,title: 'Success');
      if (userType == 'Admin') {
        Get.to(() => AdminDashboardPage());
      }else {
        Get.to(() => DealerDashboardPage());
      }
    } catch (error) {
      print("Failed to delete vehicle Category: $error");
      showCustomSnakeBar("Failed to delete vehicle Category.", color: Colors.red);
    }
  }



  Future<bool> _showConfirmationDialog() async {
    return await Get.dialog<bool>(
      AlertDialog(
        title: Text("Confirm Deletion"),
        content: Text("Are you sure you want to delete this Category?"),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: Text("Delete"),
          ),
        ],
      ),
    ) ??
        false;
  }



}




















































// class VCategoryController extends GetxController {
//   var selectedCategoryId = 1.obs;  // Default to the first category id
//   List<VehicleCategoryModel> categories = [
//     VehicleCategoryModel(id: 1, name: "Car"),
//     VehicleCategoryModel(id: 2, name: "Bus"),
//     VehicleCategoryModel(id: 3, name: "Sumo"),
//     VehicleCategoryModel(id: 4, name: "Truck"),
//     VehicleCategoryModel(id: 5, name: "MiniVan"),
//     VehicleCategoryModel(id: 6, name: "Jeep"),
//     VehicleCategoryModel(id: 7, name: "MicroBus"),
//     VehicleCategoryModel(id: 8, name: "Auto"),
//     VehicleCategoryModel(id: 9, name: "Van"),
//     VehicleCategoryModel(id: 10, name: "Scooter"),
//     VehicleCategoryModel(id: 11, name: "Cycle"),
//     VehicleCategoryModel(id: 12, name: "Bike"),
//     VehicleCategoryModel(id: 13, name: "Scorpio"),
//
//
//     // Add more categories
//   ];
//
//   void setSelectedCategoryId(int id) {
//     selectedCategoryId.value = id;
//   }
// }


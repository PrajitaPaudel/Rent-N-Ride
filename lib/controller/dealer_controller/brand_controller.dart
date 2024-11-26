

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_frontendui/model/dealer/brand_model.dart';
import 'package:vehicle_rental_frontendui/utils/constants/colors.dart';
import 'package:vehicle_rental_frontendui/widgets/admin/display/admin_dashboard_page.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/menu/sidebar.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/show_custom_snakebar.dart';
import 'package:vehicle_rental_frontendui/widgets/dealer/dealer_dashboard_page.dart';



import '../../service/dealer/categories_service.dart';
import '../../storage/app_storage.dart';
import '../../widgets/admin/display/display_brand.dart';

class BrandController extends GetxController {
  final BrandService brandService = BrandService();

  var brands = <VehicleBrandModel>[].obs;
  var isLoading = true.obs;
  var selectedBrandId = Rxn<int>();
  var currentBrand = Rxn<VehicleBrandModel>();
  final userType = AppStorage.getUserType();

  @override
  void onInit() {
    super.onInit();
    loadBrands(); // Load brands when the controller initializes
  }

  void loadBrands() async {
    try {
      isLoading(true);
      brands.value = await brandService.fetchBrands();
    } finally {
      isLoading(false);
    }
  }

  void selectBrand(int id) {
    selectedBrandId.value = id;
    print('Selected brand ID: $id'); // For debugging purposes
  }




  Future<void> addVehicleBrand(String brandName, double rentalCharge) async {
    VehicleBrandModel newBrand = VehicleBrandModel(
      vehicleBrandName: brandName, rentalCharge: rentalCharge,);
    try {
      await brandService.addVehicleBrand(newBrand);
      showCustomSnakeBar('Brand add Successfully',title:'Success',color: TColors.success );
      if (userType == 'Admin') {
        Get.to(() => AdminDashboardPage());
      }else {
        Get.to(() => DealerDashboardPage());
      }
    } catch (e) {
      throw e;
    }
  }
  Future<void> loadBrandDetails(int id) async {
    isLoading(true);
    try {
      currentBrand.value = await brandService.fetchBrandById(id);
    } catch (e) {
      print("Error loading brand details: $e");
    } finally {
      isLoading(false);
    }
  }




  Future<void> updateVehicleBrand(int id, String brandName, double rentalCharge) async {
    VehicleBrandModel updatedBrand = VehicleBrandModel(
      brandId: id,
      vehicleBrandName: brandName,
      rentalCharge: rentalCharge,
    );

    try {
      await brandService.updateVehicleBrand(id, updatedBrand);
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

  Future<void> deleteBrand(int? brandId) async {
    bool confirmDelete = await _showConfirmationDialog();
    if (!confirmDelete) return;

    try {
      await _deleteBrandService.deleteBrand(brandId!);
      showCustomSnakeBar("Vehicle deleted successfully.", color: Colors.green,title: 'Success');
      Get.to(() => AdminDisplayBrand());
    } catch (error) {
      print("Failed to delete vehicle: $error");
      showCustomSnakeBar("Failed to delete vehicle.", color: Colors.red);
    }
  }



  Future<bool> _showConfirmationDialog() async {
    return await Get.dialog<bool>(
      AlertDialog(
        title: Text("Confirm Deletion"),
        content: Text("Are you sure you want to delete this Brand?"),
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



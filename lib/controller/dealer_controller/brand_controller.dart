

import 'package:get/get.dart';
import 'package:vehicle_rental_frontendui/model/dealer/brand_model.dart';



import '../../service/dealer/categories_service.dart';

class BrandController extends GetxController {
  final BrandService brandService = BrandService();

  var brands = <VehicleBrandModel>[].obs;
  var isLoading = true.obs;
  var selectedBrandId = Rxn<int>();

  @override
  void onInit() {
    super.onInit();
    loadBrands();  // Load brands when the controller initializes
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
    print('Selected brand ID: $id');  // For debugging purposes
  }
}


// class BrandController extends GetxController {
//   var selectedBrandId = 1.obs;  // Default to the first category id
//   List<VehicleBrandModel> brand = [
//     VehicleBrandModel(id: 1, name: "Hyundai"),
//     VehicleBrandModel(id: 2, name: "Suzuki"),
//     VehicleBrandModel(id: 3, name: "Toyota"),
//     VehicleBrandModel(id: 4, name: "Honda"),
//     VehicleBrandModel(id: 5, name: "Tata"),
//     VehicleBrandModel(id: 6, name: "Ashok Leyland"),
//     VehicleBrandModel(id: 7, name: "Mahindra"),
//     VehicleBrandModel(id: 8, name: "Eicher"),
//     VehicleBrandModel(id: 9, name: "Other"),
//     // Add more categories
//   ];
//
//   void setSelectedBrandId(int id) {
//     selectedBrandId.value = id;
//   }
// }
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vehicle_rental_frontendui/controller/dealer_controller/brand_controller.dart';
import 'package:vehicle_rental_frontendui/controller/dealer_controller/uploader_controller.dart';
import 'package:vehicle_rental_frontendui/controller/dealer_controller/vehicle_controller.dart';
import 'package:vehicle_rental_frontendui/controller/dealer_controller/vehicle_model_controller.dart';
import 'package:vehicle_rental_frontendui/controller/user_controller/user_type_controller.dart';
import 'package:vehicle_rental_frontendui/model/dealer/brand_model.dart';
import 'package:vehicle_rental_frontendui/model/dealer/vechicle_model.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/show_custom_snakebar.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/small_text.dart';
import 'package:vehicle_rental_frontendui/widgets/dealer/dealer_dashboard_page.dart';
import 'package:vehicle_rental_frontendui/widgets/dealer/vehicle_register/edit_vehicle_registration.dart';

import '../../../controller/dealer_controller/c_dropdown_controller.dart';
import '../../../controller/dealer_controller/damage_dropdown_controller.dart';
import '../../../controller/dealer_controller/get_latest_vehicle_id_controller.dart';
import '../../../model/dealer/category_model.dart';
import '../../../model/dealer/vehicle_registration_model.dart';
import '../../../model/login_model.dart';
import '../../../storage/app_storage.dart';
import '../../../utils/constants/colors.dart';
import '../../common widget/button/Custom_button.dart';
import '../../common widget/container/circular_container.dart';
import '../../common widget/text/big_text.dart';

class VRegistrationFrom extends StatefulWidget {
  final VRegistrationBody? vRegistration;
  const VRegistrationFrom({super.key, this.vRegistration,});




  @override
  State<VRegistrationFrom> createState() => _VRegistrationFromState();
}

class _VRegistrationFromState extends State<VRegistrationFrom> {
  var controller = Get.put(VehicleController());
  final VehicleController _vehicleController = VehicleController();
  final LatestVehicleController latestVehicleController = Get.put(LatestVehicleController());

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imagefiles = [];
  LoginModel? loginModel;

  final VCategoryController vCategoryController = Get.put(
      VCategoryController());
  final BrandController brandController = Get.put(BrandController());
  final VehicleModelController modelController = Get.put(VehicleModelController());
  final VDamageController vDamageController = Get.put(VDamageController());
  final AvailableController availableController =
  Get.put(AvailableController());
  final PPopularController popularController = Get.put(PPopularController());
  var priceController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();


    // Retrieve user data from AppStorage
    var userData = AppStorage.readUser; // This should be a Map
    if (userData != null) {
      loginModel = LoginModel.fromJson(userData); // Convert it back to LoginModel
    }
  }


  void _vehicleRegistration() {
    int? categoryId = vCategoryController.selectedCategoryId.value;
    int? brandId = brandController.selectedBrandId.value;
    int? modelId = modelController.selectedModelId.value;
    String price = priceController.text.trim();
    String damage = vDamageController.selectedDamage.value;
    bool available = availableController.selectedAvailableType.value;
    bool popular = popularController.selectedPopularType.value;
    String description = descriptionController.text.trim();

    if (price.isEmpty) {
      showCustomSnakeBar('Price is required', title: 'Price');
    } else {
      controller.vregistration(
        categoryId: categoryId??0,
        brandId: brandId??0,
        modelId: modelId??0,
        price: price,
        damage: damage,
        available: available,
        popular: popular,
        images: imagefiles!, // Images from picker
        description: description,
      );
    }
  }


  Future<void> openImages() async {
    var pickedFiles = await imagePicker.pickMultiImage();

    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      List<XFile> validImages = [];
      for (var pickedFile in pickedFiles) {
        if (await _isValidFile(pickedFile)) {
          validImages.add(pickedFile);
        }
      }

      if (validImages.isNotEmpty) {
        setState(() {
          imagefiles = validImages;
        });
      } else {
        showCustomSnakeBar("No valid images to upload.");
      }
    }
  }

  Future<bool> _isValidFile(XFile file) async {
    String fileExtension = file.path
        .split('.')
        .last
        .toLowerCase();
    if (!['jpg', 'jpeg', 'png'].contains(fileExtension)) {
      showCustomSnakeBar(
          "File ${file.name} must be a PNG, JPG, or JPEG image.");
      return false;
    }

    final fileSize = await File(file.path).length();
    if (fileSize > 102400) {
      showCustomSnakeBar(
          "File ${file.name} is too large. It must be less than 100KB.");
      return false;
    }

    return true;
  }


  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  ///image...................................................................//
                SizedBox(
                  height: 150,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TCircularContainer(
                          onTap: () {
                            openImages();
                          },
                          border: Border.all(color: TColors.grey),
                          height: 100,
                          width: 150,
                          // Display imageOne if selected, otherwise show the upload text
                          child: SizedBox(
                            height: 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.camera_alt),
                                BigText(
                                  text: 'Upload Image',
                                  size: 15,
                                  color: TColors.darkerGrey,
                                  fontWeight: FontWeight.w800,
                                ),
                              ],
                            ),
                          )),

                 Expanded (
                    child: TCircularContainer(
                      // border: Border.all(color: TColors.grey),

                        padding: 8,


                      // width: 200,
                      child: imagefiles != null && imagefiles!.isNotEmpty
                          ? GridView.builder(
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // Display 3 images per row
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                        ),
                        itemCount: imagefiles!.length,
                        itemBuilder: (context, index) {
                          File imageFile = File(imagefiles![index]
                              .path); // Convert XFile to File
                          return Image.file(imageFile, fit: BoxFit.cover);
                        },
                      )
                          : Center(
                        child: Text("No images selected"),
                      ),
                    ),
                  ),
                    ],
                  ),
                ),
                  const SizedBox(height: 20),


                  // Category...........................................................................//
                  Obx(() {
                    // Check if the selected category id is valid
                    int? validSelectedCategoryId;
                    if (vCategoryController.categories.isNotEmpty) {
                      validSelectedCategoryId = vCategoryController.categories
                          .firstWhere(
                              (category) => category.categoryId == vCategoryController.selectedCategoryId.value,
                          orElse: () => vCategoryController.categories.first // If not found, select the first valid category
                      )
                          .categoryId;
                    }

                    return DropdownButtonFormField<int>(
                      value: validSelectedCategoryId, // Dynamically set valid selected category id
                      decoration: InputDecoration(
                        labelText: "Select Vehicle Category",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (int? newValue) {
                        if (newValue != null) {
                          vCategoryController.selectedCategoryId.value = newValue;
                        }
                      },
                      items: vCategoryController.categories
                          .map<DropdownMenuItem<int>>((VehicleCategoryModel category) {
                        return DropdownMenuItem<int>(
                          value: category.categoryId, // Send categoryId as value
                          child: Text(category.vehicleCategoryName), // Display category name in dropdown
                        );
                      }).toList(),
                    );
                  }),

                  SizedBox(height: 20),


                  // Brand............................................................//


                  Obx(() {
                    // Check if the selected brand id is valid
                    int? validSelectedBrandId;
                    if (brandController.brands.isNotEmpty) {
                      validSelectedBrandId = brandController.brands
                          .firstWhere(
                              (brand) => brand.brandId == brandController.selectedBrandId.value,
                          orElse: () => brandController.brands.first // If not found, select the first valid brand
                      )
                          .brandId;
                    }

                    return DropdownButtonFormField<int>(
                      value: validSelectedBrandId, // Dynamically set valid selected brand id
                      decoration: InputDecoration(
                        labelText: "Select Vehicle Brand",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (int? newValue) {
                        if (newValue != null) {
                          brandController.selectedBrandId.value = newValue;
                        }
                      },
                      items: brandController.brands
                          .map<DropdownMenuItem<int>>((VehicleBrandModel brand) {
                        return DropdownMenuItem<int>(
                          value: brand.brandId, // Send id as value
                          child: Text(brand.vehicleBrandName), // Display name in dropdown
                        );
                      }).toList(),
                    );
                  }),
                  const SizedBox(height: 20),


                  // Model.............................................................//


                  Obx(() {
                    // Check if the selected model id is valid
                    int? validSelectedModelId;
                    if (modelController.models.isNotEmpty) {
                      validSelectedModelId = modelController.models
                          .firstWhere(
                              (model) => model.modelId == modelController.selectedModelId.value,
                          orElse: () => modelController.models.first // If not found, select the first valid model
                      )
                          .modelId;
                    }

                    return DropdownButtonFormField<int>(
                      value: validSelectedModelId, // Dynamically set valid selected model id
                      decoration: InputDecoration(
                        labelText: "Select Vehicle Model",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (int? newValue) {
                        if (newValue != null) {
                          modelController.selectedModelId.value = newValue;
                        }
                      },
                      items: modelController.models
                          .map<DropdownMenuItem<int>>((VehicleModel model) {
                        return DropdownMenuItem<int>(
                          value: model.modelId, // Send modelId as value
                          child: Text(model.vehicleModelName), // Display model name in dropdown
                        );
                      }).toList(),
                    );
                  }),


                  const SizedBox(height: 20),
                  TextFormField(
                    controller: priceController,
                    decoration: const InputDecoration(
                        labelStyle: TextStyle(
                          color: TColors.darkerGrey,
                        ),
                        hintStyle: TextStyle(
                          color: TColors.darkerGrey,
                        ),
                        labelText: 'Price',
                        hintText: 'Select the price per day',
                        prefixIcon: Icon(Icons.monetization_on)),
                  ),
                  const SizedBox(height: 20),
                  Obx(() {
                    return DropdownButtonFormField<String>(
                      isExpanded: true,
                      value: vDamageController.selectedDamage.value.isEmpty
                          ? null
                          : VDamageController().selectedDamage.value,
                      decoration: const InputDecoration(
                        labelText: "Select Damages",
                        labelStyle: TextStyle(
                          color: TColors.darkerGrey,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          vDamageController.setSelectedDamage(newValue);
                        }
                      },
                      items: vDamageController.damage
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    );
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: descriptionController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: 'Vehicle Description',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Enter details about the vehicle',
                      labelStyle: TextStyle(
                        color: TColors.darkerGrey,
                      ),
                      hintStyle: TextStyle(
                        color: TColors.grey,
                        fontSize: 10,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: TColors.darkerGrey)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Available - Modified to boolean
                  Obx(
                        () => Row(
                      children: [
                        Expanded(
                          child: RadioListTile<bool>(
                            title: SmallText(
                                text: 'Available',
                                textColor: TColors.darkerGrey,
                                fontWeight: FontWeight.w600),
                            value: true,
                            groupValue: availableController.selectedAvailableType.value,
                            onChanged: (value) {
                              availableController.setAvailableType(value!);
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<bool>(
                            title: SmallText(
                                text: 'Not Available',
                                textColor: TColors.darkerGrey,
                                fontWeight: FontWeight.w600),
                            value: false,
                            groupValue: availableController.selectedAvailableType.value,
                            onChanged: (value) {
                              availableController.setAvailableType(value!);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
SizedBox(height: 10,),

// Popular - Modified to boolean
                  Obx(
                        () => Row(
                      children: [
                        Expanded(
                          child: RadioListTile<bool>(
                            title: SmallText(
                                text: 'Popular',
                                textColor: TColors.darkerGrey,
                                fontWeight: FontWeight.w600),
                            value: true,
                            groupValue: popularController.selectedPopularType.value,
                            onChanged: (value) {
                              popularController.setPopularType(value!);
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<bool>(
                            title: SmallText(
                                text: 'Not Popular',
                                textColor: TColors.darkerGrey,
                                fontWeight: FontWeight.w600),
                            value: false,
                            groupValue: popularController.selectedPopularType.value,
                            onChanged: (value) {
                              popularController.setPopularType(value!);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        height: 50,
                        borderRadius: 50,
                        width: 150,
                        color: TColors.subPrimary,
                        text: "Add",
                        onTap: () {
                          _vehicleRegistration();
                          print('button press');
                          setState(() {
                            priceController.clear();
                            imagefiles!.clear();
                            vCategoryController.selectedCategoryId.value=1;
                            modelController.selectedModelId.value=1;
                            brandController.selectedBrandId.value=1;
                            priceController.clear();
                            descriptionController.clear();
                            availableController.selectedAvailableType.value=false;
                            popularController.selectedPopularType.value=false;
                          });
                        },
                      ),
                      CustomButton(
                        height: 50,
                        borderRadius: 50,
                        width: 150,
                        color: TColors.subPrimary,
                        text: "Edit",

                         onTap: () => Get.to(() =>EditVRegistrationFrom( vRegistration:widget.vRegistration )),
                      ),
                      CustomButton(
                        height: 50,
                        borderRadius: 50,
                        width: 150,
                        color: TColors.subPrimary,
                        text: "Cancel",
                        onTap: () {

                            _vehicleController.deleteVehicle( latestVehicleController.latestVehicleId.value,);

                        },
                      ),
                    ],
                  ),
                ])));
  }
}


































































































// openImages() async {
//   var pickedFiles = await imagePicker.pickMultiImage();
//   if (pickedFiles != null && pickedFiles.isNotEmpty) {
//     for (var pickedFile in pickedFiles) {
//       // Check if the selected file is a PNG, JPG, or JPEG image
//       if (['jpg', 'jpeg', 'png']
//           .contains(pickedFile.path.split('.').last.toLowerCase())) {
//         final file = File(pickedFile.path);
//         final fileSize = await file.length();
//         if (fileSize <= 102400) {
//           setState(() {
//             imagefiles!.add(pickedFile);
//             productController.uploadImages(
//               imageFiles: imagefiles!,
//               // productName: widget.product!.productName
//             );
//           });
//         } else {
//           getSnackbar(
//               message:
//               "File ${pickedFile.name} is too large. It must be less than 100KB.",
//               bgColor: Colors.red);
//         }
//       } else {
//         getSnackbar(
//             message:
//             "File ${pickedFile.name} must be a PNG, JPG, or JPEG image.",
//             bgColor: Colors.red,
//             error: true);
//       }
//     }
//     // Upload images if there are valid files
//   } else {
//     print("No images are selected.");
//   }
// }


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

import '../../../controller/dealer_controller/c_dropdown_controller.dart';
import '../../../controller/dealer_controller/damage_dropdown_controller.dart';
import '../../../model/dealer/category_model.dart';
import '../../../utils/constants/colors.dart';
import '../../common widget/button/Custom_button.dart';
import '../../common widget/container/circular_container.dart';
import '../../common widget/text/big_text.dart';

class VRegistrationFrom extends StatefulWidget {
  const VRegistrationFrom({super.key});

  @override
  State<VRegistrationFrom> createState() => _VRegistrationFromState();
}

class _VRegistrationFromState extends State<VRegistrationFrom> {
  var controller = Get.put(VehicleController());

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imagefiles = [];

  final VCategoryController vCategoryController = Get.put(
      VCategoryController());
  final BrandController brandController = Get.put(BrandController());
  final VModelController modelController = Get.put(VModelController());
  final VDamageController vDamageController = Get.put(VDamageController());
  final AvailableController availableController =
  Get.put(AvailableController());
  final PopularController popularController = Get.put(PopularController());
  var priceController = TextEditingController();
  var descriptionController = TextEditingController();
  final UploaderController uploaderController = Get.put(UploaderController());

  // List<CategoryModel> categories = [
  //   CategoryModel(id: 1,name: "Fresh"),
  //   CategoryModel(id: 2,name: "old")
  // ];

  void _vehicleRegistration() {
    int categoryId = vCategoryController.selectedCategoryId.value;
    int brandId = brandController.selectedBrandId.value;
    int modelId = modelController.selectedModel.value;
    String price = priceController.text.trim();
    String damage = vDamageController.selectedDamage.value;
    String available = availableController.selectedAvailableType.value;
    String popular = popularController.selectedPopularType.value;
    String description=descriptionController.text.trim();

    if (price.isEmpty) {
      showCustomSnakeBar('Price is required', title: 'Price');
    } else if (available.isEmpty) {
      showCustomSnakeBar('Select Available or Not', title: 'Available');
    } else if (popular.isEmpty) {
      showCustomSnakeBar('Select Popular or Not', title: 'Popular');
    }
    else if (popular.isEmpty) {
      showCustomSnakeBar('Select Popular or Not', title: 'Popular');
    }else {
      // Call the controller to register the vehicle
      controller.vregistration(
        categoryId: categoryId,
        brandId: brandId,
        modelId: modelId,
        price: price,
        damage: damage,
        available: available,
        popular: popular,
        images: imagefiles!, // Pass the images selected from the picker
        description:description,
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
                  DropdownButtonFormField<int>(
                    value: vCategoryController.selectedCategoryId.value,
                    decoration: InputDecoration(
                      labelText: "Select Vehicle Category",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (int? newValue) {
                      if (newValue != null) {
                        vCategoryController.setSelectedCategoryId(newValue);
                      }
                    },
                    items: vCategoryController.categories
                        .map<DropdownMenuItem<int>>((
                        VehicleCategoryModel category) {
                      return DropdownMenuItem<int>(
                        value: category.id, // Send id as value
                        child: Text(category.name), // Display name in dropdown
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),


                  // Brand............................................................//


                  DropdownButtonFormField<int>(
                    value: brandController.selectedBrandId.value,
                    decoration: InputDecoration(
                      labelText: "Select Vehicle Brand",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (int? newValue) {
                      if (newValue != null) {
                        brandController.setSelectedBrandId(newValue);
                      }
                    },
                    items: brandController.brand
                        .map<DropdownMenuItem<int>>((VehicleBrandModel brand) {
                      return DropdownMenuItem<int>(
                        value: brand.id, // Send id as value
                        child: Text(brand.name), // Display name in dropdown
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),


                  // Model.............................................................//


                  DropdownButtonFormField<int>(
                    value: modelController.selectedModel.value,
                    decoration: InputDecoration(
                      labelText: "Select Vehicle Model",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (int? newValue) {
                      if (newValue != null) {
                        modelController.setSelectedModelId(newValue);
                      }
                    },
                    items: modelController.model
                        .map<DropdownMenuItem<int>>((VehicleModel model) {
                      return DropdownMenuItem<int>(
                        value: model.id, // Send id as value
                        child: Text(model.name), // Display name in dropdown
                      );
                    }).toList(),
                  ),


                  const SizedBox(height: 20),
                  TextFormField(
                    controller: priceController,
                    decoration: const InputDecoration(
                        labelStyle: TextStyle(
                          color: TColors.darkerGrey,
                        ),
                        hintStyle: TextStyle(
                          color: TColors.grey,
                        ),
                        labelText: 'Price',
                        hintText: '100',
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
                  Obx(
                        () =>
                        Row(
                          children: [
                            Expanded(
                              child: RadioListTile(
                                title: SmallText(
                                    text: ' Available',
                                    textColor: TColors.darkerGrey,
                                    fontWeight: FontWeight.w600),
                                value: 'Available',
                                groupValue:
                                availableController.selectedAvailableType.value,
                                onChanged: (value) {
                                  availableController.setAvailableType(value!);
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile(
                                title: SmallText(
                                  text: 'Not Available',
                                  textColor: TColors.darkerGrey,
                                  fontWeight: FontWeight.w600,
                                ),
                                value: 'notAvailable',
                                groupValue:
                                availableController.selectedAvailableType.value,
                                onChanged: (value) {
                                  availableController.setAvailableType(value!);
                                },
                              ),
                            ),
                          ],
                        ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(
                        () =>
                        Row(
                          children: [
                            Expanded(
                              child: RadioListTile(
                                title: SmallText(
                                    text: ' Popular',
                                    textColor: TColors.darkerGrey,
                                    fontWeight: FontWeight.w600),
                                value: 'Available',
                                groupValue:
                                popularController.selectedPopularType.value,
                                onChanged: (value) {
                                  popularController.setPopularType(value!);
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile(
                                title: SmallText(
                                  text: 'Not Popular',
                                  textColor: TColors.darkerGrey,
                                  fontWeight: FontWeight.w600,
                                ),
                                value: 'notPopular',
                                groupValue:
                                popularController.selectedPopularType.value,
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
                        },
                      ),
                      CustomButton(
                        height: 50,
                        borderRadius: 50,
                        width: 150,
                        color: TColors.subPrimary,
                        text: "Cancel",
                        onTap: () => Get.to(() => DealerDashboardPage()),
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


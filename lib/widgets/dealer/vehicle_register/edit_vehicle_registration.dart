
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
import 'package:vehicle_rental_frontendui/widgets/common%20widget/appbar/header_curveappbar.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/show_custom_snakebar.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/small_text.dart';
import 'package:vehicle_rental_frontendui/widgets/dealer/dealer_dashboard_page.dart';

import '../../../controller/dealer_controller/c_dropdown_controller.dart';
import '../../../controller/dealer_controller/damage_dropdown_controller.dart';
import '../../../controller/dealer_controller/get_latest_vehicle_id_controller.dart';
import '../../../model/dealer/category_model.dart';
import '../../../model/dealer/vehicle_registration_model.dart';
import '../../../storage/app_storage.dart';
import '../../../utils/constants/colors.dart';
import '../../common widget/button/Custom_button.dart';
import '../../common widget/container/circular_container.dart';
import '../../common widget/text/big_text.dart';


class EditVRegistrationFrom extends StatefulWidget {
  final VRegistrationBody? vRegistration;  // Make it nullable

  const EditVRegistrationFrom({super.key, this.vRegistration});  // Default to null if not passed

  @override
  State<EditVRegistrationFrom> createState() => _VRegistrationFromState();
}

class _VRegistrationFromState extends State<EditVRegistrationFrom> {
  var controller = Get.put(VehicleController());
  final LatestVehicleController latestVehicleController = Get.put(LatestVehicleController());

  bool isAvailable = true;
  bool isPopular = false;

  late int categoryId;
  late int brandId;
  late int modelId;
  late String damage;
  late String description;


  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imagefiles = [];

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

    if (widget.vRegistration != null) {
      print("Category ID: ${widget.vRegistration!.categoryId}");
      print("Brand ID: ${widget.vRegistration!.brandId}");
      print("Model ID: ${widget.vRegistration!.modelId}");
      print("Damage: ${widget.vRegistration!.damage}");
      print("Description: ${widget.vRegistration!.description}");
      print("Price: ${widget.vRegistration!.price}");
      categoryId = widget.vRegistration!.categoryId;
      brandId = widget.vRegistration!.brandId;
      modelId = widget.vRegistration!.modelId;
      vDamageController.selectedDamage.value = widget.vRegistration!.damage;
      descriptionController.text = widget.vRegistration!.description; // Update here
      priceController.text = widget.vRegistration!.price; // Update here
      isAvailable = widget.vRegistration!.available;
      isPopular = widget.vRegistration!.popular;
    } else {
      // Set default values if vRegistration is null
      categoryId = 1;
      brandId = 1;
      modelId = 1;
      priceController.text = '';
      descriptionController.text = '';
      isAvailable = true;
      isPopular = false;
    }
  }


  void _updateVehicle() async {
    VRegistrationBody updatedVehicle = VRegistrationBody(
      vehicleId: latestVehicleController.latestVehicleId.value,
      categoryId: categoryId,
      brandId: brandId,
      modelId: modelId,
      price: priceController.text.trim(),
      description: descriptionController.text.trim(),
      damage: vDamageController.selectedDamage.value, // Fallback to empty if null
      available: isAvailable,
      popular: isPopular,
      files: [], // Use existing images if not updated
    );

    List<File> images = imagefiles!.map((xFile) => File(xFile.path)).toList();
    await controller.updateVehicleDetails(updatedVehicle, images);
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
                  THeaderAppBar(text: 'Register Vehicle'),
            BigText(
              text: 'Add Details',
              size: 21,
              fontWeight: FontWeight.w800,
              color: TColors.darkGrey,
            ),
            SizedBox(height: 8),
            SmallText(
              text: 'You are required to fill information correctly',
              textColor: TColors.darkGrey,
            ),
            SizedBox(height: 16),
            Form(
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
                          Obx(() => DropdownButtonFormField<int>(
                            value: vCategoryController.selectedCategoryId.value,
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
                                value: category.categoryId, // Send id as value
                                child: Text(category.vehicleCategoryName), // Display name in dropdown
                              );
                            }).toList(),
                          )),
                          SizedBox(height: 20),


                          // Brand............................................................//


                          Obx(() => DropdownButtonFormField<int>(
                            value: brandController.selectedBrandId.value,
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
                          )),

                          const SizedBox(height: 20),


                          // Model.............................................................//


                          Obx(() => DropdownButtonFormField<int>(
                            value: modelController.selectedModelId.value,
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
                          )),


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
                                text: "Update",
                                onTap: () {
                                  _updateVehicle();
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
                        ]))),
          ],
        ),
      ),
    );
  }
}

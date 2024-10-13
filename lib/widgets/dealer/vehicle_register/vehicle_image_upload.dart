import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vehicle_rental_frontendui/controller/dealer_controller/uploader_controller.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/button/Custom_button.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/circular_container.dart';
import 'package:vehicle_rental_frontendui/widgets/dealer/Dcategories/add_vehicle.dart';
import 'package:vehicle_rental_frontendui/widgets/dealer/vehicle_register/add_categories_pages.dart';
import 'package:vehicle_rental_frontendui/widgets/dealer/vehicle_register/vehicle_register_page.dart';

import '../../../utils/constants/colors.dart';
import '../../common widget/appbar/header_curveappbar.dart';
import '../../common widget/text/big_text.dart';
import '../../common widget/text/small_text.dart';



class VehicleImageUpload extends StatelessWidget {
  const VehicleImageUpload({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploaderController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const THeaderAppBar(text: 'Add Vehicle'),
            Column(
              children: [
                BigText(
                  text: 'Upload Images',
                  size: 21,
                  fontWeight: FontWeight.w800,
                  color: TColors.darkGrey,
                ),
                SizedBox(height: 8),
                SmallText(
                  text: 'You are required to upload at least two images to proceed',
                  textColor: TColors.darkGrey,
                ),
              ],
            ),
            SizedBox(height: 40),
            SizedBox(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Image One
                        TCircularContainer(
                          onTap: () {
                            controller.pickImage('one');
                          },
                          border: Border.all(color: TColors.grey),
                          height: 150,
                          width: 180,
                          // Display imageOne if selected, otherwise show the upload text
                          child: Obx(() => controller.imageOne.value != null
                              ? Image.file(controller.imageOne.value!,
                              fit: BoxFit.cover)
                              : Center(
                            child: BigText(
                              text: 'Upload Image',
                              size: 15,
                              color: TColors.darkerGrey,
                              fontWeight: FontWeight.w800,
                            ),
                          )),
                        ),
                        // Image Four
                        TCircularContainer(
                          onTap: () {
                            controller.pickImage('four');
                          },
                          border: Border.all(color: TColors.grey),
                          height: 150,
                          width: 180,
                          // child: Obx(() => controller.imageFour.value != null
                          //     ? Image.file(controller.imageFour.value!,
                          //     fit: BoxFit.cover)
                          //     : Center(
                          //   child: BigText(
                          //     text: 'Upload Image',
                          //     size: 15,
                          //     color: TColors.darkerGrey,
                          //     fontWeight: FontWeight.w800,
                          //   ),
                          // )),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Image Two
                        TCircularContainer(
                          onTap: () {
                            controller.pickImage('two');
                          },
                          border: Border.all(color: TColors.grey),
                          height: 150,
                          width: 180,
                          // child: Obx(() => controller.imageTwo.value != null
                          //     ? Image.file(controller.imageTwo.value!,
                          //     fit: BoxFit.cover)
                          //     : Center(
                          //   child: BigText(
                          //     text: 'Upload Image',
                          //     size: 15,
                          //     color: TColors.darkerGrey,
                          //     fontWeight: FontWeight.w800,
                          //   ),
                          // )),
                        ),
                        // Image Three
                        TCircularContainer(
                          onTap: () {
                            controller.pickImage('three');
                          },
                          border: Border.all(color: TColors.grey),
                          height: 150,
                          width: 180,
                          // child: Obx(() => controller.imageThree.value != null
                          //     ? Image.file(controller.imageThree.value!,
                          //     fit: BoxFit.cover)
                          //     : Center(
                          //   child: BigText(
                          //     text: 'Upload Image',
                          //     size: 15,
                          //     color: TColors.darkerGrey,
                          //     fontWeight: FontWeight.w800,
                          //   ),
                          // )),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Back Button
                        CustomButton(
                          text: 'Back',
                          onTap: () {
                            Get.to(() => AddVehicle());
                          },
                          height: 50,
                          borderRadius: 50,
                          width: 150,
                          color: TColors.subPrimary,
                        ),
                        // Next Button - Upload the images
                        CustomButton(
                          text: 'Next',
                          onTap: ()  {
                            // await controller.uploadImagesToBackend();
                            Get.to(() => AddCategories());
                          },
                          height: 50,
                          borderRadius: 50,
                          width: 150,
                          color: TColors.subPrimary,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}







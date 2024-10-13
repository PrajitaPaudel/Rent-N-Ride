import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/circular_container.dart';
import 'package:vehicle_rental_frontendui/widgets/dealer/vehicle_register/add_brand_page.dart';
import 'package:vehicle_rental_frontendui/widgets/dealer/vehicle_register/vehicle_image_upload.dart';

import '../../../controller/dealer_controller/c_dropdown_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../common widget/appbar/header_curveappbar.dart';
import '../../common widget/button/Custom_button.dart';
import '../../common widget/text/big_text.dart';
import '../../common widget/text/small_text.dart';
class AddCategories extends StatelessWidget {
  const AddCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final VCategoryController vCategoryController  = Get.put(VCategoryController());
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              THeaderAppBar(text: "Register Vehicle"),
              Column(
              children: [
                BigText(
                  text: 'Add New Category',
                  size: 21,
                  fontWeight: FontWeight.w800,
                  color: TColors.darkGrey,
                ),
                SizedBox(height: 8),
                SmallText(
                  text: 'You are required to fill information correctly',
                  textColor: TColors.darkGrey,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TCircularContainer(
                    radius: 40,
                   padding: 12,
                   height: 250,
                   width: 400,

                   backgroundColor: Colors.grey.shade50,
                   child: Padding(
                     padding: const EdgeInsets.all(25.0),
                     child: Center(
                       // child: Obx(() {
                       //
                       //    return DropdownButtonFormField<String>(
                       //      value: vCategoryController.selectedCategory.value.isEmpty ? null :VCategoryController().selectedCategory.value,
                       //      decoration: const InputDecoration(
                       //        labelText: "Select Vehicle Category",
                       //        labelStyle: TextStyle(
                       //          color: TColors.darkerGrey,
                       //        ),
                       //        border: OutlineInputBorder(),
                       //      ),
                       //      onChanged: (String? newValue) {
                       //        if (newValue != null) {
                       //          vCategoryController.setSelectedCategory(newValue);
                       //        }
                       //      },
                       //      items: vCategoryController.categories.map<DropdownMenuItem<String>>((String value) {
                       //        return DropdownMenuItem<String>(
                       //          value: value,
                       //          child: Text(value),
                       //        );
                       //      }).toList(),
                       //    );
                       //  }),
                     ),
                   ),
                  ),


                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back Button
                      CustomButton(
                        text: 'Back',
                        onTap: () {
                          Get.to(() => VehicleImageUpload());
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

                          Get.to(() => AddBrandPage());
                        },
                        height: 50,
                        borderRadius: 50,
                        width: 150,
                        color: TColors.subPrimary,
                      ),
                    ],
                  ),
                )

              ],
                    ),
            ],
          ),
        ),
    );
  }
}

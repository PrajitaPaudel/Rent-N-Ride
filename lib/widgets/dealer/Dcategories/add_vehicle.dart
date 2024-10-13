import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/appbar/header_curveappbar.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/curved_widget.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/big_text.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/small_text.dart';

import 'package:vehicle_rental_frontendui/widgets/dealer/vehicle_register/vehicle_image_upload.dart';
import '../../../controller/user_controller/categories_controller.dart';
import '../../../utils/constants/colors.dart';
import 'package:vehicle_rental_frontendui/widgets/dealer/vehicle_register/vehicle_register_page.dart';

import '../widget/d_verticle_catedories_icons.dart';

class AddVehicle extends StatelessWidget {
  const AddVehicle({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = Get.put(CategoryController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(

          children: [
            const THeaderAppBar(text: 'Add Vehicle'),
            Column(
              children: [
                BigText(text:'Pick Category',
                size: 21,
                fontWeight: FontWeight.w800,color: TColors.darkGrey,),
                SizedBox(height: 8,),
                SmallText(text: 'You are required to pick a Category',
                textColor: TColors.darkGrey,),
              ],
            ),
            SizedBox(
              height: 900,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (_,index) {

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Colors.grey.shade200,
                      ),
                      height:90,
                      child: Row(
                        children: [
                          TDCategoresImage(
                                            image: categoryController.categoryImages[index],
                                            title: categoryController.categoryTitles[index],
                                             onPressed: (){Get.to(()=>VehicleRegisterPage());},
                                              ),
                        ],
                      ),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


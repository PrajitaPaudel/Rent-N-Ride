import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_frontendui/widgets/dealer/Dcategories/add_vehicle.dart';

import 'package:vehicle_rental_frontendui/widgets/dealer/display_dealer/display_category_page.dart';
import 'package:vehicle_rental_frontendui/widgets/dealer/display_dealer/display_model.dart';

import '../../../utils/constants/image_strings.dart';
import '../../common widget/text/home_title.dart';
import '../display_dealer/display_brand.dart';


class DCategories extends StatelessWidget {
  const DCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(left: 8,right: 8,bottom: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HomeTitle(iconPath:TImages.sumo,
              text:'Add vehicle', onTap: (){
            Get.to(()=>AddVehicle());

              }),
          HomeTitle(iconPath:TImages.categories1,
              text:'Brand', onTap: (){
                Get.to(()=>DealerDisplayBrand());
              }),
          HomeTitle(iconPath:TImages.Scorpio,
              text:'Model', onTap: (){
                Get.to(()=>DealerDisplayModel());
              }),
          HomeTitle(iconPath:TImages.van,
              text:'Category',onTap: (){
                Get.to(()=>DealerDisplayCategory());
              }),
        ],
      ),
    );
  }
}
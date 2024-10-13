import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_frontendui/widgets/dealer/Dcategories/add_vehicle.dart';
import 'package:vehicle_rental_frontendui/widgets/dealer/Dcategories/self_deliver.dart';
import 'package:vehicle_rental_frontendui/widgets/dealer/Dcategories/vehicle.dart';

import '../../../utils/constants/image_strings.dart';
import '../../common widget/text/home_title.dart';


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
          HomeTitle(iconPath:TImages.car,
              text:'Add vehicle', onTap: (){
            Get.to(()=>AddVehicle());

              }),
          HomeTitle(iconPath:TImages.car,
              text:'vehicle', onTap: (){
                Get.to(()=>Vehicle());
              }),
          HomeTitle(iconPath:TImages.car,
              text:'Deliver',onTap: (){
                Get.to(()=>SelfDeliver());
              }),
        ],
      ),
    );
  }
}
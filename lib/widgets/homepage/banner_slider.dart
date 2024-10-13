import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vehicle_rental_frontendui/features/controllers/slider_controller.dart';
import 'package:vehicle_rental_frontendui/utils/constants/colors.dart';
import 'package:vehicle_rental_frontendui/utils/constants/image_strings.dart';

import 'package:get/get.dart';

import '../common widget/container/circular_container.dart';
import '../common widget/image/t_rounded_images.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
 final controller=Get.put(SliderController());
    return  Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          CarouselSlider(

            options:CarouselOptions(
              viewportFraction:0.6,
              autoPlay:true,
              animateToClosest:true,
              onPageChanged:(index,_)=>controller.updatePageIndicator(index)


            ) ,
            items: const [
              TRoundedImages(imageUrl: TImages.banner1),
              TRoundedImages(imageUrl: TImages.banner2),
              TRoundedImages(imageUrl: TImages.banner3),
              TRoundedImages(imageUrl: TImages.banner4),



            ],


          ),
      const SizedBox(height: 20),
    Center(
      child: Obx(
          ()=> Row(
            mainAxisSize: MainAxisSize.min,
          children: [
            for(int i=0; i<4; i++)
            TCircularContainer(
            width: 20,
            height: 4,
                padding: 10,
                margin: EdgeInsets.only(right:10),
                backgroundColor: controller.carousalCurrentIndex.value==i ? TColors.subPrimary:TColors.grey,

            ),
          ],
        ),
      ),
    ),


        ],
    ),
    );
  }
}



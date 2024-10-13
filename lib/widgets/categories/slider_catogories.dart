import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/image/t_rounded_images.dart';

import '../../utils/constants/image_strings.dart';



class SliderCatogories extends StatelessWidget {
  const SliderCatogories({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          children: [
      CarouselSlider(

      options:CarouselOptions(
      viewportFraction:0.6,
        enlargeCenterPage:true

      ) ,
      items: const [
        TRoundedImages(imageUrl: TImages.categories1),
        TRoundedImages(imageUrl: TImages.categories2),
        TRoundedImages(imageUrl: TImages.categories3),
        TRoundedImages(imageUrl: TImages.categories4),
        TRoundedImages(imageUrl: TImages.categories5),
        TRoundedImages(imageUrl: TImages.categories6),

      ],


    ),
   ] ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/button/Custom_button.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/big_text.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/circular_container.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/small_text.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/image/t_rounded_images.dart';
import 'package:vehicle_rental_frontendui/widgets/user/product_details/widget/brand_text_verify.dart';

import 'package:vehicle_rental_frontendui/widgets/user/product_details/widget/product_price_text.dart';
import 'package:vehicle_rental_frontendui/widgets/user/product_details/widget/product_review_page.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';


class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TCircularContainer(

              radius: 8,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding:8,
              child: SmallText( text: '25%',textColor: TColors.black,),
            ),

        SizedBox(width: 10,),
        Text("\$111",style: Theme.of(context).textTheme.labelSmall!.apply(decoration: TextDecoration.lineThrough)),
            SizedBox(width: 10,),
        TProductPriceText(price: '99',isLarge: true,),
            
          ],
        ),
        SizedBox(height: 20,),
        SmallText(text:"FZ25 YAMAHA",fontWeight: FontWeight.w600,),
        SizedBox(height: 20,),
        Row(
          children: [
            TRoundedImages(
              imageUrl: TImages.darkAppLogo,
              width: 19,
              height: 19,
            ),
            SizedBox(width: 3,),
            TBrandTextVerify(title: 'Yamaha',

            ),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            SmallText(text: 'Status:'),
            SizedBox(width: 10,),
            SmallText(text: 'Available',
            fontWeight: FontWeight.bold,),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            SmallText(text: 'Categories:'),
            SizedBox(width: 10,),
            SmallText(text: 'Bike',
              fontWeight: FontWeight.bold,),
          ],
        ),

        SizedBox(height: 10,),
        Row(
          children: [
            SmallText(text: 'Damages:'),
            SizedBox(width: 10,),
            SmallText(text: 'slightly scratch',
              fontWeight: FontWeight.bold,),
          ],
        ),
        //  SizedBox(height: 32,),
        // TCircularContainer(
        //   radius: 20,
        //   backgroundColor: TColors.lightGrey,
        //   padding: 10,
        //   child: Column(
        //     children: [
        //       SmallText(text:TTexts.productDes),
        //     ],
        //   ),
        // ),
        SizedBox(height: 32,),
        SizedBox(
          width: double.infinity,
          child: CustomButton(text: 'CheckOut', onTap: () {  },),
        ),
        
        SizedBox(height: 32,),
        BigText(text: "Description",
        fontWeight: FontWeight.w800,),
        const ReadMoreText(
          "The Yamaha FZ25 is a popular street bike in the 250cc segment, known for its balance between performance and practicality. It features a 249cc, air-cooled, SOHC, 2-valve engine that produces 20.8 hp at 8000 rpm and 20.1 Nm of torque at 6000 rpm. The FZ25 offers a smooth riding experience with its refined engine and fuel-injection technology.",

        trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: "Show more",
          trimExpandedText: "less",
          moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
          lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
        ),

        Divider(),
        SizedBox(height: 32,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BigText(text: "Review(199)",fontWeight: FontWeight.w600,),
            IconButton(onPressed:()=>Get.to(()=>ProductReviewPage()), icon: Icon(Iconsax.arrow_right_3,size:18)),
          ],
        ),


        
      ],
    );
  }
}

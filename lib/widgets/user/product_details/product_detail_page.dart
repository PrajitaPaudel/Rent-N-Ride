import 'package:flutter/material.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/curved_widget.dart';
import 'package:vehicle_rental_frontendui/widgets/user/product_details/widget/product_meta_data.dart';

import 'package:vehicle_rental_frontendui/widgets/user/product_details/widget/rating_sharing_widget.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TCurvedWidget(
              child: Container(
                color: TColors.light,
                child: Stack(
                  children: [
                    const SizedBox(
                      height: 400,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Image(image:AssetImage( TImages.categories1),fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  
                  AppBar(),
                  ],
                ),
              ),
            ),

              Padding(
                padding:EdgeInsets.only(right: 16,left: 16,bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TRatingAndShare(),
                    TProductMetaData(),
                    
                  ],
                ),
            ) ,
          ],
        ),
      ),
    );
  }
}



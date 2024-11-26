import 'package:flutter/material.dart';
import 'package:vehicle_rental_frontendui/utils/constants/image_strings.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/card/product_card_horizontal.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TProductCardHorizontal(
                imageUrl:TImages.microBus,
                defaultAssetImage:TImages.categories5 ,
                name:'car',
                category: "category",

                onTap: (){}, model: 'hhh',
            ),
          )
        ],
      ) ,
    );
  }
}

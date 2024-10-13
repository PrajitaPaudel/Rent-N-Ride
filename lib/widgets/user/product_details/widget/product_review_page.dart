import 'package:flutter/material.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/big_text.dart';


class ProductReviewPage extends StatelessWidget {
  const ProductReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace:FlexibleSpaceBar(
          centerTitle: true,
          title:BigText( text: 'Review & Ratings',
          fontWeight: FontWeight.w600,)) ,
        ) ,

      body: Column(
        children: [

        ],
      ),


    );
  }
}

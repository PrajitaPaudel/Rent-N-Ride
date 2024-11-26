import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/circular_container.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/big_text.dart';

import '../../utils/constants/colors.dart';

class VerticalContainer extends StatelessWidget {
  const VerticalContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Booking Page'),),
      body: SingleChildScrollView(
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
          shrinkWrap: true,
          itemCount: 10,
          separatorBuilder: (_, __)=>SizedBox(height: 12,),
          itemBuilder: (_, index) =>
           TCircularContainer(
            border:Border.all(color: Colors.grey.shade600),
            padding: 12,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment:MainAxisAlignment.start ,
                      children: [
                        Icon(Iconsax.ship),
                       SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment:CrossAxisAlignment.start ,
                          mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Processing',style: TextStyle(
                              color: TColors.primary,
                              fontWeight: FontWeight.bold
                            ),),
                            SizedBox(height: 7,),
                            BigText(text: '07 Nov 2024',color: Colors.grey.shade600,size: 20,fontWeight:FontWeight.bold,)
                          ],
                        ),

                      ],

                    ),
                    IconButton(onPressed:(){}, icon:Icon(Iconsax.arrow_right_34),)
                  ],
                ),
                SizedBox(height: 15,),
                Row(

                  children: [
                    Row(
                      mainAxisAlignment:MainAxisAlignment.start ,
                      children: [
                        Icon(Iconsax.tag),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment:CrossAxisAlignment.start ,
                          mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Booked',style: TextStyle(
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),),
                            SizedBox(height: 7,),
                            BigText(text: '[#1014]',color: Colors.grey.shade600,size: 17,fontWeight:FontWeight.bold,)
                          ],
                        ),

                      ],

                    ),
                    SizedBox(width:90 ,),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.start ,
                      children: [
                        Icon(Iconsax.calendar),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment:CrossAxisAlignment.start ,
                          mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Booking Date',style: TextStyle(
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),),
                            SizedBox(height: 7,),
                            BigText(text: '[03 Nov 2024]',color: Colors.grey.shade600,size: 17,fontWeight:FontWeight.bold,)
                          ],
                        ),

                      ],

                    ),
                  ],
                )

              ],

            ),
          ),
        ),
      ),
    );
  }
}

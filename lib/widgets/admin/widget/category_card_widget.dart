import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vehicle_rental_frontendui/utils/constants/text_strings.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/circular_container.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/big_text.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/small_text.dart';

class THCard extends StatelessWidget {
  const THCard({super.key, required this.title, this.edit, this.delete, this.color=Colors.blueGrey, this.child});
   final String title;
  final void Function()? edit;
  final void Function()? delete;
  final Color?  color;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return TCircularContainer(

      radius: 25,
      backgroundColor: color,
      padding: 20,

      child:Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmallText(text: title,size: 17,fontWeight: FontWeight.w600,),
          if (child != null)
            SizedBox(
              height: 40, // Define height for the child
              child: child!,
            ),


          Row(
            children: [
              IconButton(onPressed: edit, icon:Icon(Iconsax.edit),),
              SizedBox(width: 3),
              IconButton(onPressed:delete, icon:Icon(Icons.delete),)

            ],
          )

        ],
      ) ,
    );
  }
}

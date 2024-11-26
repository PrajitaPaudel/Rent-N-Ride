import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../common widget/container/circular_container.dart';
import '../../common widget/text/big_text.dart';
import '../../common widget/text/small_text.dart';


class TAdminDashboardCard extends StatelessWidget {
  const TAdminDashboardCard({
    super.key, required this.title, required this.subtitle, required this.icon, required this.color, required this.stats, this.onTap,
  });

  final String title,subtitle;
  final IconData icon;
  final Color color;
  final int stats;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TCircularContainer(
        radius: 25,
        backgroundColor: color,
        padding: 20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmallText(text: title,textColor: Colors.grey.shade600,size: 19,fontWeight: FontWeight.w600,),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigText(text: subtitle,fontWeight:FontWeight.w700,color: TColors.darkerGrey,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(icon,color: TColors.success,size:15,),
                        SmallText(text: '$stats%',textColor: TColors.success,fontWeight: FontWeight.w600,),
                      ],
                    ),
                    SizedBox(height: 5,),
                    SmallText(text: 'Compare to Nov 23 ',textColor: Colors.grey,)

                  ],
                )
              ],

            ),


          ],
        ),

      ),
    );
  }
}

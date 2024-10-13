
import 'package:flutter/material.dart';


import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../common widget/text/small_text.dart';

class AppBar extends StatelessWidget {
  const AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top:45,bottom:45 ),
      padding:EdgeInsets.only(left: 0,right: 20),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius:30,
            backgroundColor: Colors.white,

            backgroundImage: AssetImage(TImages.lightAppLogo),
          ),

          Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("RentN'Ride",
                overflow:TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily:'Pacifico',
                  color: Colors.teal,
                  fontSize:20,
                  fontWeight:FontWeight.w800,
                ),),
              SmallText(text:"Unlock your freedom" ),

            ],
          ),
          SizedBox(width: 80),
          Container(
            width:45,
            height:45,
            child: Icon(Icons.search,color:Colors.white),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: TColors.subPrimary,
            ),
          )

        ],
      ),
    );
  }
}

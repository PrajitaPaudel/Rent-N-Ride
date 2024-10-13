
import 'package:flutter/cupertino.dart';

import '../../../utils/constants/colors.dart';



class TRoundedImages extends StatelessWidget {

  final double? width,height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final double borderRadius;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;

  final bool isNetworkingImage;


  const TRoundedImages({
    super.key,
    this.height,
    this.width,
    required this.imageUrl,
    this.backgroundColor=TColors.softGrey,
    this.fit=BoxFit.contain,
    this.padding,
    this.isNetworkingImage=false,
    this.borderRadius=20.0,
    this.applyImageRadius=true,
    this.border,
    this.onPressed

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding:padding,
        decoration: BoxDecoration(
            border: border,color: backgroundColor,
            borderRadius:BorderRadius.circular(borderRadius)),
        child:ClipRRect
          (borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius):BorderRadius.zero,
          child:Image(image:isNetworkingImage ? NetworkImage(imageUrl):AssetImage(imageUrl)as ImageProvider,
            fit: fit,
          ),
        ),



      ),
    );
  }
}

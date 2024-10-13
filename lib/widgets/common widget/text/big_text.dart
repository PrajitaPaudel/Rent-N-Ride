
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {

   Color? color;
  final String text;
  final double size;
  final TextOverflow overflow;
   final FontWeight? fontWeight;
   final TextAlign textAlign;
   final EdgeInsetsGeometry padding;




  BigText({super.key,
     this.color=const Color(0xFF332d2d),
    required this.text,
  this.overflow=  TextOverflow.ellipsis,
    this.size=20,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.left,
    this.padding = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    // Color textColor = Theme.of(context).textTheme.bodyMedium?.color ?? const Color(0xFF332d2d);
    return Padding(
      padding: padding,
      child: Text(
        text,
        maxLines: 1,
        overflow: overflow,
        textAlign: textAlign,
        style: TextStyle(
          fontFamily:'Poppins',
          // color: color,
          color:color,
          fontSize:size,
          fontWeight:fontWeight,
        ),

      ),
    );
  }
}

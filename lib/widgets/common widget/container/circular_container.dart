import 'package:flutter/material.dart';
import 'package:vehicle_rental_frontendui/utils/constants/colors.dart';

import 'package:flutter/material.dart';

class TCircularContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color? backgroundColor;
  final String? text;
  final Function()? onTap;
  final Border? border;
  final List<BoxShadow>? boxShadow; // Use List<BoxShadow> for custom shadows

  const TCircularContainer({
    super.key,
    this.width,
    this.height,
    this.radius = 10,
    this.padding = 0,
    this.margin,
    this.child,
    this.backgroundColor,
    this.text,
    this.onTap,
    this.border,
    this.boxShadow, // Allow custom box shadows
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          boxShadow: boxShadow ?? [],
          border: border,
          color: backgroundColor,
        ),
        child: child ?? (text != null ? Center(child: Text(text!)) : null),
      ),
    );
  }
}


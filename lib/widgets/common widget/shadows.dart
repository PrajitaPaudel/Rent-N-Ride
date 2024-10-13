import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class TShadowStyle{

  static final verticalProductShadows=BoxShadow(
    color: TColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0,2)
  );


  static final horizontalProductShadow=BoxShadow(
      color: TColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0,2)
  );
}
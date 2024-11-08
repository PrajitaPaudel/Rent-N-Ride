import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../container/curved_widget.dart';


class THeaderAppBar extends StatelessWidget {
  const THeaderAppBar({
    super.key, required this.text,  this.color=Colors.white,  this.backgroundColor=TColors.subPrimary,
  });
  final String text;
  final Color color;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return TCurvedWidget(
      child: Container(
        color: TColors.subPrimary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 150,
          child: AppBar(
            centerTitle: true,
            backgroundColor: backgroundColor,
            title: Text(
              text,
              style: TextStyle(
                color: color,
                fontFamily: 'poppins',
                fontSize: 22,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
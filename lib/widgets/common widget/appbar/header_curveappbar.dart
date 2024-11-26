import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../container/curved_widget.dart';


class THeaderAppBar extends StatelessWidget {
  const THeaderAppBar({
    super.key,
    required this.text,
    this.textColor = Colors.white,
    this.backgroundColor = TColors.subPrimary,

  });

  final String text;
  final Color textColor;
  final Color backgroundColor;


  @override
  Widget build(BuildContext context) {
    return TCurvedWidget(
      child: Container(
        color: backgroundColor,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 150,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between title and action
            children: [
              Expanded(
                child: AppBar(
                  centerTitle: true,
                  backgroundColor: backgroundColor,
                  title: Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontFamily: 'poppins',
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

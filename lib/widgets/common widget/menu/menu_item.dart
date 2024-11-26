import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/small_text.dart';

import '../../../utils/constants/colors.dart';


class TMenuItem extends StatefulWidget {
  final String itemName;
  final IconData icon;
  final Widget Function() destinationPage; // Page to navigate to
  final Color? backGroundColor;

  TMenuItem({
    required this.itemName,
    required this.icon,
    required this.destinationPage,
    this.backGroundColor = Colors.blueGrey,
  });

  @override
  _TMenuItemState createState() => _TMenuItemState();
}

class _TMenuItemState extends State<TMenuItem> {
  bool isSelected = false;

  void _toggleSelectionAndNavigate() {
    setState(() {
      isSelected = !isSelected;
    });

    // Navigate to the page provided by destinationPage
    Get.to(widget.destinationPage());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: _toggleSelectionAndNavigate,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? widget.backGroundColor : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  widget.icon,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
              SmallText(
                text: widget.itemName,
                textColor: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w700,
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
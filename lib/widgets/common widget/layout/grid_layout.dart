import 'package:flutter/material.dart';

import '../../user/product_details/widget/product_card_vertical.dart';


class TGridLayout extends StatelessWidget {
  const TGridLayout({
    super.key, required this.itemCount,  required this.itemBuilder,

  });

  final int itemCount;

  final Widget? Function(BuildContext,int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        mainAxisExtent:288,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
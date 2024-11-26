import 'package:flutter/material.dart';

class TVerticalRowLayout extends StatelessWidget {
  const TVerticalRowLayout({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,  // Makes the ListView take only the space it needs
      physics: const NeverScrollableScrollPhysics(), // Prevents scrolling if it's inside another scrollable widget
      itemCount: itemCount,
      padding: EdgeInsets.zero,
      itemBuilder: itemBuilder,
    );
  }
}

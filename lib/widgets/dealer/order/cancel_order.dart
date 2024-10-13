import 'package:flutter/material.dart';


class CancelledOrder extends StatelessWidget {
  const CancelledOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.red,
      ) ,
    );
  }
}



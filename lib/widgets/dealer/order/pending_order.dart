import 'package:flutter/material.dart';


class PendingOrder extends StatelessWidget {
  const PendingOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.pink,
      ) ,
    );
  }
}


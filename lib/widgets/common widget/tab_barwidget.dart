import 'package:flutter/material.dart';


class TabWidget extends StatelessWidget {
  final String text;


  const TabWidget({
    Key? key,
    required this.text,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        text,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
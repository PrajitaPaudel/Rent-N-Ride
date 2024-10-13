import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmallText extends StatefulWidget {
  final Color? textColor;  // Nullable to allow for a default color
  final String text;
  final double size;
  final double height;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  SmallText({
    this.textColor,
    required this.text,
    this.height = 1.5,
    this.size = 12,
    this.textAlign = TextAlign.start,
    this.fontWeight = FontWeight.normal,
  });

  @override
  State<SmallText> createState() => _SmallTextState();
}

class _SmallTextState extends State<SmallText> {
  @override
  Widget build(BuildContext context) {

    Color textColor = widget.textColor ?? const Color(0xFF4A4A4A);

    return Text(
      widget.text,
      textAlign: widget.textAlign,
      style: TextStyle(
        fontFamily: 'Poppins',
        color: textColor,
        fontSize: widget.size,
        fontWeight: widget.fontWeight,
        height: widget.height,
      ),
    );
  }
}


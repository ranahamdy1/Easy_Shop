import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      required this.textSize,
      required this.fontWeight,
      required this.color});
  final String text;
  final double textSize;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Text(text,
            style: TextStyle(
                fontSize: textSize, fontWeight: fontWeight, color: color)));
  }
}

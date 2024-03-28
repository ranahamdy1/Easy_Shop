import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomInfoItem extends StatelessWidget {
  const CustomInfoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
            text: '\$ 212.99',
            textSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold),
        Padding(
          padding: EdgeInsets.only(right: 8),
          child: Row(
            children: [
              Icon(Icons.star, color: Colors.orangeAccent, size: 20),
              SizedBox(width: 6),
              Text('5.0')
            ],
          ),
        )
      ],
    );
  }
}

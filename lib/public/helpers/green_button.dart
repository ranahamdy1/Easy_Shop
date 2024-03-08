import 'package:easy_shop/public/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyGreenButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final  page;

  const MyGreenButton({
    Key? key,
    required this.text,
    required this.page,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push (
          context,
          MaterialPageRoute(builder: (context) => page()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          width: 392,
          height: 55,
          decoration: BoxDecoration(
            color: colorPrimary,
            borderRadius: BorderRadius.circular(2),
          ),
          child: Center(
            child: Text(text, style: const TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}

import 'package:easy_shop/public/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final validator;
  final suffixIcon;
  final prefixIcon;
  final textType;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    required this.textType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextFormField(
          keyboardType: textType,
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: colorPrimary),
                borderRadius: BorderRadius.circular(2)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(2)),
            fillColor: colorSecondary,
            filled: true,
            hintText: hintText,
            //hintStyle: AppTextStyle().greyText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          )),
    );
  }
}

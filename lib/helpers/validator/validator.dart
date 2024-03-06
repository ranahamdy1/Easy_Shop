import 'package:flutter/material.dart';

class Validator {
  static String? generalField(String value, BuildContext context,
      {String? fieldName}) {
    if (value.isEmpty) {
      if (fieldName != null) {
        return ' حقل $fieldName مطلوب!';
      } else {
        return 'هذا الحقل مطلوب!';
      }
    } else {
      return null;
    }
  }
}

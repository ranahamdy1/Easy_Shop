import 'package:easy_shop/core/router/router.dart';
import 'package:easy_shop/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  //navigatorKey: navigatorKey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashPage(),
    );
  }
}

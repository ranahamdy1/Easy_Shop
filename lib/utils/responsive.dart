import 'package:flutter/material.dart';

class AppResponsive extends StatelessWidget {
  final Widget mobile;
  final Widget? mobileLarge;
  final Widget tablet;
  final Widget desktop;

  const AppResponsive(
      {Key? key,
      required this.mobile,
      required this.tablet,
      required this.desktop,
      this.mobileLarge})
      : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 500;

  static bool isMobileLarge(BuildContext context) =>
      MediaQuery.of(context).size.width >= 500 &&
      MediaQuery.of(context).size.width < 700;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 700 &&
      MediaQuery.of(context).size.width < 1100;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width >= 1100) {
      return desktop;
    } else if (size.width >= 700 && size.width < 1100) {
      return tablet;
    } else if (size.width >= 500 && mobileLarge != null) {
      return mobileLarge!;
    } else {
      return mobile;
    }
  }
}

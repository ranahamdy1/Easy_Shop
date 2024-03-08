import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:easy_shop/features/auth/register/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.greenAccent, Colors.white],
        ),
      ),
      child: AnimatedSplashScreen(
        duration: 1500,
        splashIconSize: 200,
        splashTransition: SplashTransition.fadeTransition,
        animationDuration: const Duration(milliseconds: 1500),
        splash: SvgPicture.asset("assets/images/svg/splash.svg"),
        nextScreen: RegisterScreen(),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

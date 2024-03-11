import 'package:easy_shop/public/shared/local/shared_preferences.dart';
import 'package:easy_shop/public/shared/remote/logic/dio_helper.dart';
import 'package:flutter/material.dart';
import 'features/auth/register/register_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  //navigatorKey: navigatorKey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterScreen(),
    );
  }
}

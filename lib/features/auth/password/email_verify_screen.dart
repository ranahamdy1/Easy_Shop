import 'package:easy_shop/core/cubits/password_cubit/password_cubit.dart';
import 'package:easy_shop/features/auth/login/login_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:easy_shop/public/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'create_new_password_screen.dart';

class EmailVerifyScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String? otpCode;

    return BlocProvider(
      create: (context) => PasswordCubit(),
      child: BlocConsumer<PasswordCubit, PasswordState>(
        listener: (context, state) {
          if (state is PasswordSuccessState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CreateNewPasswordScreen(code: otpCode!)));
          } else if (state is PasswordFailedState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(state.msg,
                    style: const TextStyle(
                      color: Colors.white,
                    )),
                backgroundColor: Colors.red,
              ),
            );
          } else {
            const CircularProgressIndicator();
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/images/svg/logo.svg"),
                    const Text(
                      "Login",
                      style: TextStyle(fontSize: 22, color: colorPrimary),
                    ),
                    Container(
                      child: PinCodeTextField(
                        appContext: context,
                        autoFocus: true,
                        cursorColor: Colors.black,
                        length: 6,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Colors.white,
                          borderWidth: 1,
                          activeColor: colorPrimary,
                          inactiveColor: colorPrimary,
                          selectedColor: Colors.cyan,
                          selectedFillColor: colorPrimary,
                          inactiveFillColor: Colors.white,
                        ),
                        animationDuration: Duration(milliseconds: 300),
                        backgroundColor: Colors.white,
                        enableActiveFill: true,
                        //errorAnimationController: errorController,
                        //controller: textEditingController,
                        onCompleted: (code) {
                          otpCode = code;
                          print("Completed");
                          print("code $code");
                        },
                        onChanged: (value) {
                          print("value $value");
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<PasswordCubit>(context)
                              .checkForgetPassword(
                            verify_code: otpCode.toString(),
                          );
                        }
                      },
                      child: Container(
                        width: 392,
                        height: 55,
                        decoration: BoxDecoration(
                          color: colorPrimary,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: const Center(
                          child: Text(
                            "verify",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Widget buildPinCodeFields(BuildContext context) {
//   String? otpCode;
//
//   return Container(
//     child: PinCodeTextField(
//       appContext: context,
//       autoFocus: true,
//       cursorColor: Colors.black,
//       length: 6,
//       obscureText: false,
//       animationType: AnimationType.fade,
//       pinTheme: PinTheme(
//         shape: PinCodeFieldShape.box,
//         borderRadius: BorderRadius.circular(5),
//         fieldHeight: 50,
//         fieldWidth: 40,
//         activeFillColor: Colors.white,
//         borderWidth: 1,
//         activeColor: colorPrimary,
//         inactiveColor: colorPrimary,
//         selectedColor: Colors.cyan,
//         selectedFillColor: colorPrimary,
//         inactiveFillColor: Colors.white,
//       ),
//       animationDuration: Duration(milliseconds: 300),
//       backgroundColor: Colors.white,
//       enableActiveFill: true,
//       //errorAnimationController: errorController,
//       //controller: textEditingController,
//       onCompleted: (code) {
//         otpCode = code;
//         print("Completed");
//         print("code $code");
//       },
//       onChanged: (value) {
//         print("value $value");
//       },
//     ),
//   );
// }

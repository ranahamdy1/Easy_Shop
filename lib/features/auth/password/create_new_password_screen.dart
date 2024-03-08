import 'package:easy_shop/core/cubits/password_cubit/password_cubit.dart';
import 'package:easy_shop/features/auth/login/login_screen.dart';
import 'package:easy_shop/public/helpers/text_form_field.dart';
import 'package:easy_shop/public/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  final passwordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordCubit(),
      child: BlocConsumer<PasswordCubit, PasswordState>(
        listener: (context, state) {
          if (state is PasswordSuccessState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/images/svg/logo.svg"),
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 22, color: colorPrimary),
                  ),
                  MyTextField(
                    hintText: 'password',
                    obscureText: false,
                    textType: TextInputType.number,
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "password must not be empty";
                      }
                      return null;
                    },
                  ),
                  MyTextField(
                    hintText: 'newPassword',
                    obscureText: false,
                    textType: TextInputType.number,
                    controller: newPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "password must not be empty";
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          // BlocProvider.of<PasswordCubit>(context).forgetPassword(
                          //   password: PasswordController.text,
                          //   newPassword: newPasswordController.text,
                          // );
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
                            "continues",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

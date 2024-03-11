import 'package:easy_shop/core/cubits/login_cubit/login_cubit.dart';
import 'package:easy_shop/features/auth/password/forgetPassword_screen.dart';
import 'package:easy_shop/features/bottom_nav_bar/home/home_screen.dart';
import 'package:easy_shop/public/helpers/text_form_field.dart';
import 'package:easy_shop/public/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          } else if (state is LoginFailedState) {
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
                    hintText: 'email',
                    obscureText: false,
                    textType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "email must not be empty";
                      }
                      return null;
                    },
                  ),
                  MyTextField(
                    hintText: 'password',
                    obscureText: true,
                    textType: TextInputType.number,
                    controller: passwordController,
                    suffixIcon: const Icon(Icons.visibility),
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
                          BlocProvider.of<LoginCubit>(context).login(
                            email: emailController.text,
                            password: passwordController.text,
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
                            "LOGIN",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgetPasswordScreen()));
                      },
                      child: Text("forget password")),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

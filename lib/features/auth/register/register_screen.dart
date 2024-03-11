import 'package:easy_shop/core/cubits/register_cubit/register_cubit.dart';
import 'package:easy_shop/features/auth/login/login_screen.dart';
import 'package:easy_shop/public/helpers/text_form_field.dart';
import 'package:easy_shop/public/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          } else if (state is RegisterFailedState) {
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
          return SafeArea(
            child: Scaffold(
              body: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      SvgPicture.asset("assets/images/svg/logo.svg"),
                      const Text(
                        "create account",
                        style: TextStyle(fontSize: 22, color: colorPrimary),
                      ),
                      MyTextField(
                        hintText: 'name',
                        obscureText: false,
                        textType: TextInputType.name,
                        controller: nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "name must not be empty";
                          }
                          return null;
                        },
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
                      MyTextField(
                        hintText: 'confirm_password',
                        obscureText: true,
                        textType: TextInputType.number,
                        suffixIcon: const Icon(Icons.visibility),
                        controller: confirmPasswordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "phone must not be empty";
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: InkWell(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<RegisterCubit>(context).register(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                password_confirmation: confirmPasswordController.text,
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
                                "signUp",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

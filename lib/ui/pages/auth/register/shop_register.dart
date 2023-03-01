// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:shopup/ui/style/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/auth_cubit/auth_cubit.dart';
import '../../../cubits/states/auth_states/auth_states.dart';
import '../../../widgets/reusable_widgets.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
          top: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Create Account",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 35,
                color: defualtColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Register to Discover Your World of Shopping!",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(
              height: 50,
            ),
            defaultFormField(
              false,
              isEnabled: true,
              showSuffixIcon: false,
              hintText: "Email Address",
              formController: emailController,
              formIcon: const Icon(Icons.email_outlined),
            ),
            const SizedBox(
              height: 30,
            ),
            defaultFormField(
              false,
              isEnabled: true,
              showSuffixIcon: false,
              hintText: "Username",
              formController: nameController,
              formIcon: const Icon(
                Icons.lock_outline,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            defaultFormField(
              true,
              isEnabled: true,
              showSuffixIcon: true,
              hintText: "Confirm-password",
              formController: passwordController,
              formIcon: const Icon(
                Icons.lock_outline,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            defaultFormField(
              false,
              isEnabled: true,
              showSuffixIcon: false,
              hintText: "Phone Number",
              formController: phoneController,
              formIcon: const Icon(
                Icons.phone,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is LoadingRegistrationAuthState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: defualtColor,
                    ),
                  );
                } else if (state is ErrorRegistrationAuthState) {
                  toastWidget(
                    "${state.successModel.message}",
                    msgColor: ToastMessageColor.warning.toastColor,
                  );
                } else if (state is SuccessRegistrationAuthState) {
                  toastWidget(
                    "${state.successModel.message}",
                    msgColor: ToastMessageColor.success.toastColor,
                  ).then((value) {
                    Navigator.of(context).pushReplacementNamed("login");
                  });
                } else if (state is ErrorServerRegistrationAuthState) {
                  toastWidget(
                    "check your Internet connection status",
                    msgColor: ToastMessageColor.warning.toastColor,
                  );
                }
                return Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: defualtColor,
                      padding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 90,
                      ),
                    ),
                    onPressed: () {
                      AuthCubit.get(context).authregisterRequest(
                        email: emailController.text,
                        password: passwordController.text,
                        name: nameController.text,
                        phone: phoneController.text,
                      );
                    },
                    child: const Text(
                      "Create Account",
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
